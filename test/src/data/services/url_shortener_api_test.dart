import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_mobile_test/src/config/http/http.dart';
import 'package:nubank_mobile_test/src/data/services/api/url_shortener_api.dart';
import 'package:nubank_mobile_test/src/domain/entities/alias_entity.dart';

import 'url_shortener_api_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  late UrlShortenerApi api;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    api = UrlShortenerApi(client: mockClient);
  });

  group('[UrlShortenerApi]', () {
    test('createAlias returns AliasEntity on success', () async {
      final url = 'https://example.com';
      final data = {
        "alias": "123",
        "_links": {
          "self": url,
          "short": "https://any_site.com/api/alias/123",
        },
      };

      when(mockClient.post(any)).thenAnswer(
        (_) async => ClientResponse(
          data: data,
          statusCode: 200,
        ),
      );

      final result = await api.createAlias(url);
      verify(mockClient.post(any)).called(1);

      expect(result, isA<AliasEntity>());
      expect(result?.alias, '123');
      expect(result?.links.self, url);
    });

    test('createAlias returns null on error', () async {
      when(mockClient.post(any)).thenThrow(Exception('error'));

      final result = await api.createAlias('https://fail.com');

      expect(result, isNull);
      verify(mockClient.post(any)).called(1);
    });

    test('getUrlFromAlias returns url on success', () async {
      final alias = 'abc123';
      final url = 'https://example.com';
      final responseData = {'url': url};

      when(mockClient.get(any)).thenAnswer(
        (_) async => ClientResponse(
          data: responseData,
          statusCode: 200,
        ),
      );

      final result = await api.getUrlFromAlias(alias);
      verify(mockClient.get(any)).called(1);

      expect(result, url);
    });

    test('getUrlFromAlias returns null on error', () async {
      when(mockClient.get(any)).thenThrow(Exception('error'));

      final result = await api.getUrlFromAlias('fail');

      expect(result, isNull);
      verify(mockClient.get(any)).called(1);
    });
  });
}
