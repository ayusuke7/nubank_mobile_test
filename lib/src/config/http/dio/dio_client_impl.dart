import 'package:dio/dio.dart';

import '../client/client.dart';
import '../client/client_request.dart';
import '../client/client_response.dart';
import 'dio_adapter.dart';

class DioFactory {
  static Dio dio() => Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      contentType: Headers.jsonContentType,
    ),
  )..interceptors.add(LogInterceptor());
}

class DioClientImpl implements Client {
  final Dio _dio;

  DioClientImpl({required Dio dio}) : _dio = dio;

  @override
  Future<ClientResponse> get(ClientRequest request) async {
    try {
      final response = await _dio.get(
        request.url,
        queryParameters: request.queryParameters,
      );

      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<ClientResponse> post(ClientRequest request) async {
    try {
      final response = await _dio.post(
        request.url,
        data: request.data,
        queryParameters: request.queryParameters,
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }
}
