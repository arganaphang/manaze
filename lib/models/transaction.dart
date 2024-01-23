import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 2)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense;
}

const transactionTypeString = <TransactionType, String>{
  TransactionType.income: "Income",
  TransactionType.expense: "Expense",
};

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int amount;

  @HiveField(3)
  TransactionType type;

  @HiveField(4)
  DateTime createdAt;

  Transaction(this.id, this.title, this.amount, this.type, this.createdAt);
}
