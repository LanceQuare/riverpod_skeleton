import 'package:dio/dio.dart';

class DioUtils {
  static final DioUtils _singleton = DioUtils._internal();
  factory DioUtils() => _singleton;
  DioUtils._internal();

  late final Dio _dio;
  Dio get dio => _dio;

  init() {
    final options = BaseOptions(
      baseUrl: 'http://192.168.1.241:8000',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  setToken(String token) {
    _dio.options.headers['Authorization'] = token;
  }
}