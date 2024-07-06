import 'package:intl/intl.dart';

extension DateHuman on DateTime {
  String toHuman() {
    return DateFormat.yMMMMEEEEd().format(this);
  }
}
