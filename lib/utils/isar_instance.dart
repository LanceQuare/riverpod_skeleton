import 'package:hi_riveroid/models/user_cache.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarInstance {
  static final IsarInstance _singleton = IsarInstance._internal();
  factory IsarInstance() {
    return _singleton;
  }

  IsarInstance._internal();

  Isar? _isar;
  Isar? get isar => _isar;


  Future init() async {
    if(_isar != null) return;
    // Initialize Isar
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserCacheSchema],
      directory: dir.path,
    );
  }
}