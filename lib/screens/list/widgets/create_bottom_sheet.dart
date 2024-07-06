import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/screens/list/list_screen_controller.dart';

class CreateBottomSheet extends StatefulWidget {
  const CreateBottomSheet({super.key});

  @override
  State<CreateBottomSheet> createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final appController = Get.find<ApplicationController>();
  final listScreenController = Get.find<ListScreenController>();
  final tabs =
      transactionTypeString.entries.map((e) => Tab(e.key, e.value)).toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Add Transaction',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              TextFormField(
                autofocus: true,
                controller: listScreenController.inputTitleController,
                decoration: const InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: listScreenController.inputAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Amount"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Amount can't be empty";
                  }
                  if (int.tryParse(value) == null) {
                    return "Amount must be number";
                  }
                  if ((int.tryParse(value) ?? 0) <= 0) {
                    return "Amount must be greater than 0";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
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
                          listScreenController
                              .onInputTransactionTypeChange(tabs[idx].type);
                        },
                        child: Obx(
                          () => Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: tabs[idx].type ==
                                      listScreenController
                                          .inputTransactionType.value
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
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
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back();
                    appController.onAddTransaction(
                      listScreenController.getDataFormAndResetFormState(),
                    );
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(CupertinoIcons.add, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          "Add",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab {
  TransactionType type;
  String label;
  Tab(this.type, this.label);
}
