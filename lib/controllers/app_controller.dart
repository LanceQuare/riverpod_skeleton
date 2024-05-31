import 'package:hi_riveroid/models/user_cache.dart';
import 'package:hi_riveroid/utils/isar_instance.dart';
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
}