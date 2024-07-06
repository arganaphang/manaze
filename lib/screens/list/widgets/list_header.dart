import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/screens/list/list_screen_controller.dart';

import 'create_bottom_sheet.dart';

class ListHeader extends StatelessWidget {
  ListHeader({super.key});

  final appController = Get.find<ApplicationController>();
  final listScreenController = Get.find<ListScreenController>();
  final tabs =
      transactionTypeString.entries.map((e) => Tab(e.key, e.value)).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transaction",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(.4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, idx) {
                    return GestureDetector(
                      onTap: () {
                        final value = tabs[idx].type ==
                                listScreenController.transactionType.value
                            ? null
                            : tabs[idx].type;
                        listScreenController.onTransactionTypeChange(value);
                        appController.onUpdateTransactions(value);
                      },
                      child: Obx(
                        () => Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: tabs[idx].type ==
                                    listScreenController.transactionType.value
                                ? Theme.of(context).colorScheme.primaryContainer
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
            IconButton(
              icon: const Icon(
                CupertinoIcons.add_circled,
                size: 32,
              ),
              onPressed: () {
                _renderBottomSheet(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  _renderBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const CreateBottomSheet();
      },
    );
  }
}

class Tab {
  TransactionType type;
  String label;
  Tab(this.type, this.label);
}
