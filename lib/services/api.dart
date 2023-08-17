import 'package:UpTech/services/LoggingInterceptor.dart';
import 'package:UpTech/services/api_problem.dart';
import 'package:dio/dio.dart';

import '../tool/common.dart';

class Api {
  late Dio _dio;
  static final Api _instance = Api._internal();

  factory Api() => _instance;

  Api._internal() {
    _dio = Dio();
    _dio.options.baseUrl = Common.BASE_API;
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = 20000;
    _dio.interceptors.add(LoggingInterceptor());
  }

  get dio => _dio;

  Future<Map<String, dynamic>> handlerResponse(Future<Response> handle) async {
    try {
      Response response = await handle;
      return response.data;
    } on DioError catch (error) {
      print("res error---${error.response}");
      return handlerError(error);
    }
  }

}
