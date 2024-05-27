import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@riverpod
class AppController extends _$AppController {
  @override
  void build() {}

  Future<String> getCachedUser() async {
    // Get cached user logic here
    return 'Lance';
  }
}