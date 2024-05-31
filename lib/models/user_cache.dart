import 'package:isar/isar.dart';

part 'user_cache.g.dart';

@collection
class UserCache {
  @Name("id")
  Id isarId = Isar.autoIncrement;

  @Name("userId")
  String? id;
  String? name;
  String? token;
}