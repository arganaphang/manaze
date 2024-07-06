import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';

import 'list_screen_controller.dart';
import 'widgets/list_header.dart';
import 'widgets/list_transaction.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final appController = Get.find<ApplicationController>();
  final listScreenController = Get.put(ListScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ListHeader(), const SizedBox(height: 16), ListTransaction()],
    );
  }
}
