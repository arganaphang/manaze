import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/widgets/transaction_card.dart';

class ListTransaction extends StatelessWidget {
  ListTransaction({super.key});

  final appController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView.separated(
          itemBuilder: (ctx, idx) {
            return TransactionCard(
              trx: appController.transactions[idx],
            );
          },
          separatorBuilder: (ctx, idx) {
            return const SizedBox(height: 16);
          },
          itemCount: appController.transactions.length,
        ),
      ),
    );
  }
}
