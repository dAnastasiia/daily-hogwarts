import 'package:dio/dio.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://hp-api.herokuapp.com/api/',
    ),
  );

  static Dio getInstance() => _dio;
}
