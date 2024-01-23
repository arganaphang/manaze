import 'package:manaze/dto/transaction_dto.dart';

import 'package:manaze/models/transaction.dart';
import 'package:manaze/repositories/transaction_repository.dart';

import '../transaction_service.dart';

class TransactionServiceImpl implements TransactionService {
  final TransactionRepository repo;

  TransactionServiceImpl(this.repo);

  @override
  Future<Transaction> createTransaction(TransactionCreateDTO data) async {
    return repo.createTransaction(data);
  }

  @override
  Future<void> deleteTransactionByID(int id) async {
    return repo.deleteTransactionByID(id);
  }

  @override
  Transaction getTransactionByID(int id) {
    return repo.getTransactionByID(id);
  }

  @override
  List<Transaction> getTransactions() {
    return repo.getTransactions();
  }

  @override
  Future<Transaction> updateTransactionByID(
    int id,
    TransactionUpdateDTO data,
  ) async {
    return repo.updateTransactionByID(id, data);
  }
}
