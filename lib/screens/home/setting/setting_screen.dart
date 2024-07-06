import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final applicationController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Setting Screen"),
    );
  }
}
