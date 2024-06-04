import 'package:riverpod_skeleton/controllers/app_controller.dart';
import 'package:riverpod_skeleton/models/user.dart';
import 'package:riverpod_skeleton/models/user_cache.dart';
import 'package:riverpod_skeleton/services/user_service.dart';
import 'package:riverpod_skeleton/utils/isar_instance.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  void build() {}


  Future<void> login(String username, String password) async {
    // Login logic here
    Isar? isar = IsarInstance().isar;
    if(isar == null) return;
    User result = await UserService().login(username, password);
    UserCache cache = UserCache();
    cache.id = result.id;
    cache.name = result.name;
    cache.token = result.token;
    await ref.read(appControllerProvider.notifier).updateCache(cache);
  }
}