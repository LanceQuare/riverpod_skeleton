// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoEventStreamListenerHash() =>
    r'8517daa4353222e2fab9f61d729dced9413fe347';

/// See also [todoEventStreamListener].
@ProviderFor(todoEventStreamListener)
final todoEventStreamListenerProvider = AutoDisposeStreamProvider<int>.internal(
  todoEventStreamListener,
  name: r'todoEventStreamListenerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoEventStreamListenerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoEventStreamListenerRef = AutoDisposeStreamProviderRef<int>;
String _$todoControllerHash() => r'd27f9e638826b3094d4855a75d486b7d500ce876';

/// See also [TodoController].
@ProviderFor(TodoController)
final todoControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoController, String>.internal(
  TodoController.new,
  name: r'todoControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoController = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
