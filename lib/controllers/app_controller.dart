import 'package:riverpod_skeleton/models/user_cache.dart';
import 'package:riverpod_skeleton/utils/dio_utils.dart';
import 'package:riverpod_skeleton/utils/isar_utils.dart';
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
    Isar isar = IsarUtils().isar;
    UserCache? cache = await isar.userCaches.where().findFirst();
    if(cache != null && cache.token != null && cache.token!.isNotEmpty) DioUtils().setToken(cache.token!);
    return cache;
  }

  Future updateCache(UserCache cache) async {
    Isar isar = IsarUtils().isar;
    await isar.writeTxn(() async {
      await isar.userCaches.putByName(cache);
    });
    if(cache.token != null && cache.token!.isNotEmpty) DioUtils().setToken(cache.token!);
    state = AsyncData(cache);
  }
}