import 'client_request.dart';
import 'client_response.dart';

abstract interface class Client {
  Future<ClientResponse> post(ClientRequest request);

  Future<ClientResponse> get(ClientRequest request);
}
