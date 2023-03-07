import 'package:intl/intl.dart';

class TextFormatter {
  static String formatPrice(double price) {
    return NumberFormat('#,###').format(price);
  }
}