// ignore_for_file: deprecated_member_use

import 'package:logger/logger.dart';

class MLogger {
  MLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
  );

  // Log a debug message
  static void d(String message) {
    _logger.d(message);
  }

  // Log an informational message
  static void i(String message) {
    _logger.i(message);
  }

  // Log a warning message
  static void w(String message) {
    _logger.w(message);
  }

  // Log an error message
  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  // Log a verbose message
  static void v(String message) {
    _logger.v(message);
  }

  // Log a fatal message
  static void f(String message) {
    _logger.wtf(message); // Logger.wtf is used for fatal issues
  }
}


