class ClientRequest {
  final String path;
  final dynamic data;
  final String baseUrl;
  final Map<String, dynamic> headers;
  final Map<String, dynamic>? queryParameters;

  ClientRequest({
    required this.path,
    this.baseUrl = '',
    this.data,
    this.queryParameters,
    this.headers = const {},
  });

  String get url => '$baseUrl$path';

  @override
  toString() =>
      '''ClientRequest{
        url: $url,
        data: $data,
        headers: $headers,
        queryParameters: $queryParameters,
      }''';
}
