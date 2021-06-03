import 'dart:core';

import 'package:dio/dio.dart';
import 'package:my_app/core/constant/url_constant.dart';

class AppClient {
  DioSingleton dioSingleton = DioSingleton();
}

class DioSingleton {
  late final Dio dio;
  static DioSingleton _dioSingleton = DioSingleton._internal();

  DioSingleton._internal() {
    BaseOptions baseOptions = BaseOptions(baseUrl: UrlConstant.BASE_URL);
    dio = Dio(baseOptions);
  }

  factory DioSingleton() {
    return _dioSingleton;
  }
}
