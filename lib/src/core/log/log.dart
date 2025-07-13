import 'dart:convert';

import 'package:logger/logger.dart';

const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

Object? prettyJson(Object? data) {
  try {
    return _encoder.convert(data);
  } on JsonUnsupportedObjectError catch (_) {
    return data;
  }
}

class Log {
  late Logger _logger;
  String _context = '';

  Log(String className) {
    _context = className;
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
      ),
    );
  }

  void info(String message, {Object? data}) {
    _base('INFO', message, data);
  }

  void error(String message, {Object? data}) {
    _base('ERROR', message, data);
  }

  void _base(
    String level,
    String message,
    Object? data,
  ) {
    final content = '$message ${data != null ? ': ${jsonEncode(data)}' : ''}';
    _logger.i('[$level][$_context] $content');
  }
}
