class ClientResponse {
  dynamic data;
  int? statusCode;
  String? message;

  ClientResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  @override
  String toString() {
    return '''ClientResponse{
      statusCode: $statusCode
      data: $data, 
      message: $message, 
    }''';
  }
}
