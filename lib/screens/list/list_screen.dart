import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/screens/create/create_screen.dart';
import 'package:manaze/widgets/transaction_card.dart';

import 'list_screen_controller.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final appController = Get.find<ApplicationController>();
  final listScreenController = Get.put(ListScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transaction",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 16),
        _renderTabs(context),
        const SizedBox(height: 16),
        _renderList(context)
      ],
    );
  }

  Widget _renderList(BuildContext ctx) {
    return GetBuilder<ListScreenController>(builder: (c) {
      return Obx(() => Expanded(
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
          ));
    });
  }

  _renderTabs(BuildContext context) {
    final tabs =
        transactionTypeString.entries.map((e) => Tab(e.key, e.value)).toList();
    return Row(
      children: [
        Expanded(
          child: GetBuilder<ListScreenController>(
            builder: (controller) => SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, idx) {
                  return GestureDetector(
                    onTap: () {
                      final value =
                          tabs[idx].type == controller.transactionType.value
                              ? null
                              : tabs[idx].type;
                      controller.onTransactionTypeChange(value);
                      appController.updateTransactions(value);
                    },
                    child: Obx(
                      () => Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color:
                              tabs[idx].type == controller.transactionType.value
                                  ? Colors.grey.withOpacity(.15)
                                  : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Text(tabs[idx].label),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, idx) {
                  return const SizedBox(width: 8);
                },
                itemCount: tabs.length,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            CupertinoIcons.add_circled,
            color: Colors.black54,
            size: 32,
          ),
          onPressed: () {
            Get.toNamed(CreateScreen.routeName);
          },
        ),
      ],
    );
  }
}

class Tab {
  TransactionType type;
  String label;
  Tab(this.type, this.label);
}
