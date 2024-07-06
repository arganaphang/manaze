import 'package:intl/intl.dart';

extension IntHuman on int {
  String toHuman() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return currencyFormatter.format(this);
  }
}
