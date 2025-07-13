import 'client_response.dart';

class ClientException {
  dynamic error;
  ClientResponse? response;

  ClientException({
    required this.message,
    required this.error,
    this.response,
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  @override
  String toString() {
    return '''ClientException{
      statusCode: $statusCode
      response: $response, 
      error: $error, 
      message: $message, 
    }''';
  }
}
