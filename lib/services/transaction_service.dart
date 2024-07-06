import 'package:manaze/dto/transaction_dto.dart';
import 'package:manaze/models/transaction.dart';

abstract class TransactionService {
  Future<Transaction> createTransaction(TransactionCreateDTO data);
  Future<void> deleteTransactionByID(int id);
  Transaction getTransactionByID(int id);
  List<Transaction> getTransactions(TransactionType? type);
  Future<Transaction> updateTransactionByID(int id, TransactionUpdateDTO data);
}
