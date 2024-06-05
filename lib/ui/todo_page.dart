import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_skeleton/controllers/todo_controller.dart';

class TodoPage extends ConsumerWidget  {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);
    final todoEventStream = ref.watch(todoEventStreamListenerProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            todoEventStream.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
              data: (data) => Text('Todos: ${data}'),
            ),
            todos.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
              data: (data) => Text('Todos: ${data.length}'),
            ),
            Text(
              'Welcome to Todo Page!',
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('The B Page'),
  //     ),
  //     body: const Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(
  //             'Welcome to Hi Riverpod!',
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  
}