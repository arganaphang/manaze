import 'package:manaze/models/transaction.dart';

class TransactionCreateDTO {
  String title;
  int amount;
  TransactionType type;
  TransactionCreateDTO(this.title, this.amount, this.type);
}

class TransactionUpdateDTO {
  String title;
  int amount;
  TransactionType type;
  TransactionUpdateDTO(this.title, this.amount, this.type);
}
