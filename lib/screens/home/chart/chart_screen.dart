import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({super.key});

  final applicationController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Chart Screen"),
    );
  }
}
