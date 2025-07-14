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

  /// Constructor
  /// [className] class name to log context
  Log(String className) {
    _context = className;
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
      ),
    );
  }

  /// Log level info
  /// [message] message to log
  /// [data] data to log
  void info(String message, {Object? data}) {
    _base('INFO', message, data);
  }

  /// Log level error
  /// [message] message to log
  /// [data] data to log
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
