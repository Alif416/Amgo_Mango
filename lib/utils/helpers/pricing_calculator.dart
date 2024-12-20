import 'package:intl/intl.dart';

class MPriceCalculator {
  MPriceCalculator._();

  static double calculateTotalPrice({
    required double unitPrice,
    required int quantity,
    double taxRate = 0.0, // Default tax rate is 0%
    double discountRate = 0.0, // Default discount rate is 0%
  }) {
    final double subtotal = unitPrice * quantity;
    final double taxAmount = subtotal * (taxRate / 100);
    final double discountAmount = subtotal * (discountRate / 100);
    final double totalPrice = subtotal + taxAmount - discountAmount;
    return totalPrice;
  }

  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    final NumberFormat formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(amount);
  }
}


