import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_mobile_test/src/data/repositories/alias_repository.dart';
import 'package:nubank_mobile_test/src/data/services/api/url_shortener_api.dart';
import 'package:nubank_mobile_test/src/domain/dtos/alias_dto.dart';
import 'package:nubank_mobile_test/src/domain/entities/alias_entity.dart';

import 'alias_repository_test.mocks.dart';

@GenerateMocks([UrlShortenerApi])
void main() {
  late AliasRepository repository;
  late MockUrlShortenerApi mockApi;

  setUp(() {
    mockApi = MockUrlShortenerApi();
    repository = AliasRepository(urlShorApi: mockApi);
  });

  group('[AliasRepository]', () {
    group('getUrl', () {
      test('returns AliasDto when url is found', () async {
        const alias = 'testAlias';
        const url = 'https://example.com';

        when(mockApi.getUrlFromAlias(alias)).thenAnswer((_) async => url);
        final result = await repository.getUrl(alias);

        verify(mockApi.getUrlFromAlias(alias)).called(1);
        expect(result?.alias, alias);
        expect(result?.url, url);
      });

      test('returns null when url is not found', () async {
        const alias = 'notFoundAlias';

        when(mockApi.getUrlFromAlias(alias)).thenAnswer((_) async => null);
        final result = await repository.getUrl(alias);

        verify(mockApi.getUrlFromAlias(alias)).called(1);
        expect(result, isNull);
      });
    });

    group('createAlias', () {
      test('returns AliasDto when alias is created', () async {
        const url = 'https://example.com';
        const data = {
          "alias": "123",
          "_links": {
            "self": url,
            "short": "https://any_site.com/api/alias/123",
          },
        };

        when(mockApi.createAlias(url)).thenAnswer(
          (_) async => AliasEntity.fromJson(data),
        );
        final result = await repository.createAlias(url);

        verify(mockApi.createAlias(url)).called(1);
        expect(result, isA<AliasDto>());
        expect(result?.alias, data['alias']);
      });

      test('returns null when alias is not created', () async {
        const url = 'https://fail.com';

        when(mockApi.createAlias(url)).thenAnswer((_) async => null);
        final result = await repository.createAlias(url);

        verify(mockApi.createAlias(url)).called(1);
        expect(result, isNull);
      });
    });
  });
}
