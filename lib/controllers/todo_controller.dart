import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_skeleton/services/todo_service.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  Future<String> build() async => getTodoList();

  Future<String> getTodoList() async {
    // Get todo list logic here
    String result = await TodoService().getTodoList();
    return result;
  }
}