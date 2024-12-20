import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MFormatters {
  MFormatters._();

  // Text Input Formatters
  static final List<TextInputFormatter> phoneFormatter = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
  ];

  static final List<TextInputFormatter> creditCardFormatter = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(16),
    _CreditCardNumberInputFormatter(),
  ];

  // Date Formatting
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(dateTime);
  }

  // Currency Formatting
  static String formatCurrency(double amount) {
    final NumberFormat formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatter.format(amount);
  }

  // Custom Text Formatter for credit card numbers
  // ignore: non_constant_identifier_names
  static TextInputFormatter _CreditCardNumberInputFormatter() {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        final text = newValue.text;
        final buffer = StringBuffer();
        for (int i = 0; i < text.length; i++) {
          buffer.write(text[i]);
          final nonZeroIndex = i + 1;
          if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
            buffer.write(' '); // Add spaces after every 4 digits
          }
        }
        return newValue.copyWith(
          text: buffer.toString(),
          selection: TextSelection.collapsed(offset: buffer.length),
        );
      },
    );
  }
}


