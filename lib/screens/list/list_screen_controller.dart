import 'package:get/get.dart';
import 'package:manaze/models/transaction.dart';

class ListScreenController extends GetxController {
  final Rx<TransactionType?> transactionType = Rx(null);

  void onTransactionTypeChange(TransactionType? type) {
    transactionType.value = type;
  }
}
