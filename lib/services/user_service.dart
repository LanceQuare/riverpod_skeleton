import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_skeleton/models/user.dart';
import 'package:riverpod_skeleton/utils/dio_utils.dart';

class UserService {
  Future<String> getCachedUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return 'Lance';
    });
  }

  Future<User> login(String username, String password) async {
    // //Mock login
    // return Future.delayed(const Duration(seconds: 1), () {
    //   return User(id: "9487", name: username, email: '', token: 'fakeToken ru.4g41o3fu${DateTime.now().millisecondsSinceEpoch}');
    // });
    Dio dio = Dio();
    Response response = await dio.post('http://192.168.1.241:8000/login', data: {});
    Map<String, dynamic> token = json.decode(response.data);
    return User(id: "9487", name: username, email: '', token: token['token']);
  }
}