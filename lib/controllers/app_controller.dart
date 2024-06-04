import 'package:riverpod_skeleton/models/user_cache.dart';
import 'package:riverpod_skeleton/utils/isar_instance.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@riverpod
class AppController extends _$AppController {
  @override
  Future<UserCache?> build() async{
    return getCachedUser();
  }

  Future<UserCache?> getCachedUser() async {
    Isar? isar = IsarInstance().isar;
    if(isar == null) return null;
    UserCache? cache = await isar.userCaches.where().findFirst();
    return cache;
  }

  Future updateCache(UserCache cache) async {
    Isar? isar = IsarInstance().isar;
    if(isar == null) return;
    await isar.writeTxn(() async {
      await isar.userCaches.putByName(cache);
    });
    state = AsyncData(cache);
  }
}