import 'package:intl/intl.dart';

extension IntExtension on int {
  bool isEven() {
    return this % 2 == 0;
  }

  bool isOdd() {
    return this % 2 != 0;
  }

  bool isNegative() {
    return this < 0;
  }

  bool isPositive() {
    return this > 0;
  }

  double toDouble() {
    return this.toDouble();
  }

  List<int> digits() {
    return toString().split('').map((char) => int.parse(char)).toList();
  }

  times(Function(int index) action) {
    for (int i = 0; i < this; i++) {
      action(i);
    }
  }

  String toOrdinalString() {
    if (this % 100 >= 11 && this % 100 <= 13) {
      return '${this}th';
    }
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }

  String toCurrencyString(int decimalPlaces) {
    final formatter = NumberFormat.currency(
      decimalDigits: decimalPlaces,
      symbol: '\$',
    );
    return formatter.format(this / 100);
  }

  bool isInRange(int start, int end) {
    return this >= start && this <= end;
  }

  String toHexString() {
    return toRadixString(16);
  }

  String toBinaryString() {
    return toRadixString(2);
  }

  String toCurrencySymbol(String currencyCode) {
    return NumberFormat.simpleCurrency(
      locale: 'en_US',
      name: currencyCode,
    ).currencySymbol;
  }

  String toFormattedString() {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}
