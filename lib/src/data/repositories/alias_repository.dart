import '../../core/log/log_mixin.dart';
import '../../domain/dtos/alias_dto.dart';
import '../services/api/url_shortener_api.dart';

class AliasRepository with LogMixin {
  AliasRepository({
    required this.urlShorApi,
  });

  final UrlShortenerApi urlShorApi;

  Future<AliasDto> getUrl(String alias) async {
    log.info('Get URL for alias: $alias');
    final url = await urlShorApi.getUrlFromAlias(alias);

    if (url == null) {
      log.error('URL not found for alias: $alias');
      return AliasDto.fromEmpty();
    }

    return AliasDto(url: url, alias: alias);
  }

  Future<AliasDto> createAlias(String url) async {
    log.info('Creating alias for url: $url');
    final alias = await urlShorApi.createAlias(url);

    if (alias == null) {
      log.error('Alias not created for url: $url');
      return AliasDto.fromEmpty();
    }

    return AliasDto(
      alias: alias.alias,
      url: alias.links.self,
    );
  }
}
