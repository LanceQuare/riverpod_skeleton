import 'package:dio/dio.dart';
import 'package:riverpod_skeleton/utils/dio_utils.dart';

class TodoService {
  Future<String> getTodoList() async {
    Dio dio = DioUtils().dio;
    Response response = await dio.get("/todos");
    return "todos: ${response.data}";
  }
}