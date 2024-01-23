import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';
import 'models/transaction.dart';

Future<void> seed() async {
  final database = Hive.box<Transaction>("transactions");
  final rng = Random();
  await database.clear();
  var arr = <Transaction>[];
  for (var i = 0; i < 100; i++) {
    final now = DateTime.now();
    arr.add(
      Transaction(
        now.millisecond,
        "Hello ${i + 1}",
        10000 + ((i + 1) * 1000),
        rng.nextInt(100) % 2 == 0
            ? TransactionType.expense
            : TransactionType.income,
        now,
      ),
    );
  }

  await database.addAll(arr);
}
