import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manaze/dto/transaction_dto.dart';
import 'package:manaze/models/transaction.dart';

class ListScreenController extends GetxController {
  final Rx<TransactionType?> transactionType = Rx(null);
  // Form Input for create_bottom_sheet.dart
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController(text: '0');
  final Rx<TransactionType> inputTransactionType = Rx(TransactionType.income);

  void onTransactionTypeChange(TransactionType? type) {
    transactionType.value = type;
  }

  // Form Input for create_bottom_sheet.dart
  void onInputTransactionTypeChange(TransactionType type) {
    inputTransactionType.value = type;
  }

  void _resetForm() {
    inputTitleController.clear();
    inputAmountController.clear();
    inputAmountController.text = '0';
    inputTransactionType.value = TransactionType.income;
  }

  TransactionCreateDTO getDataFormAndResetFormState() {
    final title = inputTitleController.value.text;
    final amount = int.parse(inputAmountController.value.text);
    final transactionType = inputTransactionType.value;
    final data = TransactionCreateDTO(
      title,
      amount,
      transactionType,
    );
    _resetForm();
    return data;
  }
}
