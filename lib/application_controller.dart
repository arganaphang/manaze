import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/services/transaction_service.dart';

class ApplicationController extends GetxController {
  final TransactionService transactionService;

  final RxList<Transaction> transactions = <Transaction>[].obs;

  ApplicationController(this.transactionService);

  void updateTransactions(TransactionType? type) {
    transactions.value = transactionService.getTransactions(type);
  }

  @override
  onInit() {
    super.onInit();
    transactions.value = transactionService.getTransactions(null);
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("goodby from application controller");
  }
}
