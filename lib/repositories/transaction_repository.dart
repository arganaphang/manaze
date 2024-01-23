import 'package:manaze/dto/transaction_dto.dart';
import 'package:manaze/models/transaction.dart';

abstract class TransactionRepository {
  Future<Transaction> createTransaction(TransactionCreateDTO data);
  Future<void> deleteTransactionByID(int id);
  Transaction getTransactionByID(int id);
  List<Transaction> getTransactions();
  Future<Transaction> updateTransactionByID(int id, TransactionUpdateDTO data);
}
