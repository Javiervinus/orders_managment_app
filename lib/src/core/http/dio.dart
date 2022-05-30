import 'package:dio/dio.dart';
import 'package:meseros_app/src/core/env/enviroment_config.dart';
import 'package:meseros_app/src/core/http/auth_interceptors.dart';

class DioClient {
  late Dio dio;
  DioClient._internal();
  static final DioClient _singleton = DioClient._internal();
  factory DioClient() {
    _singleton.dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.apiUrl));
    _singleton.dio.interceptors.add(AppInterceptors());
    return _singleton;
  }
}
