import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_skeleton/controllers/todo_controller.dart';

class TodoPage extends ConsumerWidget  {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('The B Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            todos.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
              data: (data) => Text('Todos: ${data.length}'),
            ),
            Text(
              'Welcome to Hi Riverpod!',
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