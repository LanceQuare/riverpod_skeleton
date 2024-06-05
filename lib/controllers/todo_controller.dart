import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_skeleton/services/todo_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

@riverpod
Stream<int> todoEventStreamListener(TodoEventStreamListenerRef ref) async* {
  // Listen to todo event stream here
  final channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.241:8000/ws'));
  await for(var event in channel.stream) {
    yield event.length;
  }

  ref.onDispose(() => channel.sink.close());
}