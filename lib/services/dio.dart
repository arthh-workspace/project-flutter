import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();

  dio.options.baseUrl = "http://10.0.2.2:8000/api";

  dio.options.headers['accept'] = 'Application/Json';

  return dio;
}
