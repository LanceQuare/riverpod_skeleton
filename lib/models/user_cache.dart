import 'package:isar/isar.dart';

part 'user_cache.g.dart';

@collection
class UserCache {
  @Name("id")
  Id isarId = Isar.autoIncrement;

  @Name("userId")
  String? id;
  @Index(unique: true)
  String? name;
  String? token;
}
//https://www.dlsite.com/maniax/work/=/product_id/RJ01082861.html