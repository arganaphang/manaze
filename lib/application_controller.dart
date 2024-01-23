import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/services/transaction_service.dart';

class ApplicationController extends GetxController {
  final TransactionService transactionService;

  ApplicationController(this.transactionService);

  List<Transaction> getTransactions() {
    return transactionService.getTransactions();
  }

  @override
  onInit() {
    super.onInit();
    debugPrint("hello from application controller");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("goodby from application controller");
  }
}
