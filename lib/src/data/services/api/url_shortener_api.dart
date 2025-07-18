import '../../../config/http/client/client.dart';
import '../../../config/http/client/client_request.dart';
import '../../../core/log/log_mixin.dart';
import '../../../domain/entities/alias_entity.dart';

class UrlShortenerApi with LogMixin {
  UrlShortenerApi({
    required this.client,
  });

  final Client client;
  final String baseUrl = 'https://url-shortener-server.onrender.com/api';

  /// Create new alias for [url]
  /// Returns [AliasEntity] or null
  /// Not throws any exceptions instead returns null
  Future<AliasEntity?> createAlias(String url) async {
    try {
      final response = await client.post(
        ClientRequest(
          baseUrl: baseUrl,
          path: '/alias',
          data: {'url': url},
        ),
      );
      return AliasEntity.fromJson(response.data);
    } catch (e) {
      log.error(e.toString());
    }
    return null;
  }

  /// Get URL from alias [alias]
  /// Returns [String] or null
  /// Not throws any exceptions instead returns null
  Future<String?> getUrlFromAlias(String alias) async {
    try {
      final response = await client.get(
        ClientRequest(
          baseUrl: baseUrl,
          path: '/alias/$alias',
        ),
      );
      return response.data['url'];
    } catch (e) {
      log.error(e.toString());
    }
    return null;
  }
}
