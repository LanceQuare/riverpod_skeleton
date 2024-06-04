import 'package:riverpod_skeleton/models/user.dart';

class UserService {
  Future<String> getCachedUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return 'Lance';
    });
  }

  Future<User> login(String username, String password) async {
    //Mock login
    return Future.delayed(const Duration(seconds: 1), () {
      return User(id: "9487", name: username, email: '', token: 'fakeToken ru.4g41o3fu${DateTime.now().millisecondsSinceEpoch}');
    });
  }
}