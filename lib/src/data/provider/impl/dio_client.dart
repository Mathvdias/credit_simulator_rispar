import 'package:dio/dio.dart';

import '../../model/response/exception_responde.dart';
import '../http_client_interface.dart';

class DioClient implements IRestClient {
  final options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.plain);
  late Dio dio;

  DioClient.withAuthBasic() {
    dio = Dio(options);
    // dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //       options.headers['Authorization'] = 'Basic ${_getTokenGenerated()}';
          return handler.next(options);
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: false));
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
