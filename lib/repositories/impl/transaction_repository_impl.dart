import 'package:hive_flutter/hive_flutter.dart';
import 'package:manaze/dto/transaction_dto.dart';
import 'package:manaze/models/transaction.dart';

import '../transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Box<Transaction> database = Hive.box<Transaction>("transactions");

  TransactionRepositoryImpl();

  @override
  Future<Transaction> createTransaction(TransactionCreateDTO data) async {
    final now = DateTime.now();
    final trx = Transaction(
      now.millisecond,
      data.title,
      data.amount,
      data.type,
      now,
    );
    await database.add(trx);
    return trx;
  }

  @override
  Future<void> deleteTransactionByID(int id) async {
    final currentIdx = database.values
        .toList()
        .indexOf(database.values.firstWhere((element) => element.id == id));
    await database.deleteAt(currentIdx);
  }

  @override
  Transaction getTransactionByID(int id) {
    return database.values.firstWhere((element) => element.id == id);
  }

  @override
  List<Transaction> getTransactions(TransactionType? type) {
    return database.values
        .where((element) => type != null ? element.type == type : true)
        .toList();
  }

  @override
  Future<Transaction> updateTransactionByID(
    int id,
    TransactionUpdateDTO data,
  ) async {
    final trx = database.values.firstWhere((element) => element.id == id);
    final currentIdx = database.values.toList().indexOf(trx);

    final newTrx =
        Transaction(trx.id, data.title, data.amount, data.type, trx.createdAt);

    await database.put(currentIdx, trx);

    return newTrx;
  }
}
