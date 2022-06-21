import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../model/response/exception_responde.dart';
import '../http_client_interface.dart';

class DioClient implements IRestClient {
  final options = BaseOptions(connectTimeout: 5000, receiveTimeout: 3000);
  late Dio dio;

  DioClient.withAuthBasic() {
    dio = Dio(options);
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  void _validateException(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        throw ExceptionResponse(statusCode: 408, message: e.message);
      case DioErrorType.receiveTimeout:
        ExceptionResponse(statusCode: 408, message: e.message);
        break;
      case DioErrorType.sendTimeout:
        ExceptionResponse(statusCode: 408, message: e.message);
        break;
      case DioErrorType.response:
        ExceptionResponse(
            statusCode: e.response?.statusCode ?? 500, message: e.message);
        break;
      default:
        throw ExceptionResponse(
            statusCode: 500, message: 'Não foi possivel realizar requisição');
    }
  }

  @override
  Future<Map<String, dynamic>> post(String url, dynamic data) async {
    try {
      final response = await dio.post(url, data: data);
      if (response.statusCode == 404) {
        throw ExceptionResponse(
            statusCode: 404,
            message: response.statusMessage ?? "Não encontrado");
      }

      if (response.statusCode == 400) {
        throw ExceptionResponse(
            statusCode: 400, message: response.statusMessage ?? "Bad request");
      }
      return response.data;
    } on DioError catch (e) {
      throw ExceptionResponse(
          statusCode: e.response?.statusCode ?? 0, message: e.message);
    }
  }
}
