class UserService {
  Future<String> getCachedUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return 'Lance';
    });
  }
}