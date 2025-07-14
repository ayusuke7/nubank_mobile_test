import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_mobile_test/src/core/utils/validator.dart';

void main() {
  group('Validator.isURL', () {
    test('returns true for valid http URL', () {
      expect(Validator.isURL('http://example.com'), isTrue);
    });

    test('returns true for valid https URL', () {
      expect(Validator.isURL('https://example.com'), isTrue);
    });

    test('returns true for valid URL with www', () {
      expect(Validator.isURL('https://www.example.com'), isTrue);
    });

    test('returns true for valid URL with path and query', () {
      expect(Validator.isURL('https://example.com/path?query=1'), isTrue);
    });

    test('returns false for missing protocol', () {
      expect(Validator.isURL('www.example.com'), isFalse);
    });

    test('returns false for invalid URL', () {
      expect(Validator.isURL('not a url'), isFalse);
    });

    test('returns false for empty string', () {
      expect(Validator.isURL(''), isFalse);
    });

    test('returns false for incomplete URL', () {
      expect(Validator.isURL('http://'), isFalse);
    });

    test('returns true for URL with port', () {
      expect(Validator.isURL('https://example.com:8080'), isTrue);
    });

    test('returns true for URL with subdomain', () {
      expect(Validator.isURL('https://sub.example.com'), isTrue);
    });
  });
}
