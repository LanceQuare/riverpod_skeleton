import 'package:dio/dio.dart';

class DioUtils {
  static final DioUtils _singleton = DioUtils._internal();
  factory DioUtils() => _singleton;
  DioUtils._internal();

  final dio = Dio();
}