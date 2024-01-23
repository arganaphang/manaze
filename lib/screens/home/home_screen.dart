import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/widgets/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routeName = '/home';

  final applicationController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: renderList(context),
        ),
      ),
    );
  }

  Widget renderList(BuildContext ctx) {
    return ListView.separated(
      itemBuilder: (ctx, idx) {
        return TransactionCard(
          trx: applicationController.getTransactions()[idx],
        );
      },
      separatorBuilder: (ctx, idx) {
        return const SizedBox(height: 16);
      },
      itemCount: applicationController.getTransactions().length,
    );
  }
}
