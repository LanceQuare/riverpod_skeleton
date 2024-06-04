import 'package:riverpod_skeleton/models/user_cache.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarUtils {
  static final IsarUtils _singleton = IsarUtils._internal();
  factory IsarUtils() {
    return _singleton;
  }

  IsarUtils._internal();

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