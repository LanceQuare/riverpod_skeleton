package main

import (
    "gorm.io/gorm"
    "gorm.io/driver/sqlite"
    "log"
    "github.com/dgrijalva/jwt-go"
    "time"
    "encoding/json"
    "github.com/gorilla/mux"
    "net/http"
    "golang.org/x/crypto/bcrypt"
    "github.com/gorilla/websocket"
    "sync"
)

func main() {
    initDB()

    r := mux.NewRouter()

    r.HandleFunc("/register", Register).Methods("POST")
    r.HandleFunc("/login", Login).Methods("POST")
    r.HandleFunc("/todos", GetTodos).Methods("GET")
	r.HandleFunc("/todos", CreateTodo).Methods("POST")
	r.HandleFunc("/ws", wsHandler)

    log.Fatal(http.ListenAndServe(":8000", r))
}

type User struct {
    gorm.Model
    Username string `gorm:"unique"`
    Password string
}

type Todo struct {
    gorm.Model
    Title  string
    UserID uint
}

type Hub struct {
	clients map[*websocket.Conn]bool
	mu      sync.Mutex
}

var db *gorm.DB

func initDB() {
    var err error
    db, err = gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
    if err != nil {
        log.Fatal("failed to connect database")
    }

    db.AutoMigrate(&User{}, &Todo{})
}

var jwtKey = []byte("my_secret_key")

type Claims struct {
    Username string `json:"username"`
    jwt.StandardClaims
}

func GenerateJWT(username string) (string, error) {
    expirationTime := time.Now().Add(24 * time.Hour)
    claims := &Claims{
        Username: username,
        StandardClaims: jwt.StandardClaims{
            ExpiresAt: expirationTime.Unix(),
        },
    }

    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString(jwtKey)
}

func ValidateJWT(tokenString string) (*Claims, error) {
    claims := &Claims{}
    token, err := jwt.ParseWithClaims(tokenString, claims, func(token *jwt.Token) (interface{}, error) {
        return jwtKey, nil
    })

    if err != nil {
        return nil, err
    }

    if !token.Valid {
        return nil, jwt.ErrSignatureInvalid
    }

    return claims, nil
}

func Register(w http.ResponseWriter, r *http.Request) {
    var user User
    json.NewDecoder(r.Body).Decode(&user)

    hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
    user.Password = string(hashedPassword)

    result := db.Create(&user)
    if result.Error != nil {
        http.Error(w, "Could not register user", http.StatusInternalServerError)
        return
    }

    w.WriteHeader(http.StatusCreated)
}

func Login(w http.ResponseWriter, r *http.Request) {
    var user User
    json.NewDecoder(r.Body).Decode(&user)

    var dbUser User
    result := db.Where("username = ?", user.Username).First(&dbUser)
    if result.Error != nil {
        if result.Error == gorm.ErrRecordNotFound {
            http.Error(w, "Invalid username or password", http.StatusUnauthorized)
        } else {
            http.Error(w, "Internal server error", http.StatusInternalServerError)
        }
        return
    }

    if err := bcrypt.CompareHashAndPassword([]byte(dbUser.Password), []byte(user.Password)); err != nil {
        http.Error(w, "Invalid username or password", http.StatusUnauthorized)
        return
    }

    token, err := GenerateJWT(user.Username)
    if err != nil {
        http.Error(w, "Internal server error", http.StatusInternalServerError)
        return
    }

    json.NewEncoder(w).Encode(map[string]string{"token": token})
}

func GetTodos(w http.ResponseWriter, r *http.Request) {
    tokenString := r.Header.Get("Authorization")
    claims, err := ValidateJWT(tokenString)
    if err != nil {
        http.Error(w, "Unauthorized", http.StatusUnauthorized)
        return
    }

    var user User
    db.Where("username = ?", claims.Username).First(&user)

    var todos []Todo
    db.Where("user_id = ?", user.ID).Find(&todos)
    json.NewEncoder(w).Encode(todos)
}

func CreateTodo(w http.ResponseWriter, r *http.Request) {
	tokenString := r.Header.Get("Authorization")
	claims, err := ValidateJWT(tokenString)
	if err != nil {
		http.Error(w, "Unauthorized", http.StatusUnauthorized)
		return
	}

	var user User
	db.Where("username = ?", claims.Username).First(&user)

	var todo Todo
	json.NewDecoder(r.Body).Decode(&todo)
	todo.UserID = user.ID

	result := db.Create(&todo)
	if result.Error != nil {
		http.Error(w, "Could not create todo", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusCreated)
	hub.broadcastMessage([]byte("New todo created: " + todo.Title))
}


var hub = Hub{
	clients: make(map[*websocket.Conn]bool),
}

func (h *Hub) registerClient(conn *websocket.Conn) {
	h.mu.Lock()
	defer h.mu.Unlock()
	h.clients[conn] = true
}

func (h *Hub) unregisterClient(conn *websocket.Conn) {
	h.mu.Lock()
	defer h.mu.Unlock()
	if _, ok := h.clients[conn]; ok {
		delete(h.clients, conn)
		conn.Close()
	}
}

func (h *Hub) broadcastMessage(message []byte) {
	h.mu.Lock()
	defer h.mu.Unlock()
	for conn := range h.clients {
		conn.WriteMessage(websocket.TextMessage, message)
	}
}

var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func wsHandler(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		http.Error(w, "Could not open websocket connection", http.StatusBadRequest)
		return
	}
	hub.registerClient(conn)
	defer hub.unregisterClient(conn)

	for {
		_, _, err := conn.ReadMessage()
		if err != nil {
			break
		}
	}
}