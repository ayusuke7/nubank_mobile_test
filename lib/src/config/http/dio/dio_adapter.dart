import 'package:dio/dio.dart';

import '../client/client_exception.dart';
import '../client/client_request.dart';
import '../client/client_response.dart';

abstract class DioAdapter {
  static ClientRequest toClientRequest(RequestOptions request) {
    return ClientRequest(
      path: request.path,
      data: request.data,
      headers: request.headers,
      queryParameters: request.queryParameters,
    );
  }

  static ClientResponse toClientResponse(Response response) {
    return ClientResponse(
      data: response.data,
      statusCode: response.statusCode,
      message: response.statusMessage,
    );
  }

  static ClientException toClientException(DioException exception) {
    return ClientException(
      error: exception.error,
      message: exception.message ?? '',
      statusCode: exception.response?.statusCode,
      response: toClientResponse(exception.response!),
    );
  }
}
