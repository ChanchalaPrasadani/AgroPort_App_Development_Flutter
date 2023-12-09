import 'package:dio/dio.dart';

class CustomHttp {
  static final Dio _dio = Dio();
  static Dio getDio() => _dio;
}
