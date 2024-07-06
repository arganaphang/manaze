import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({super.key});
  static const routeName = '/create';

  final applicationController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Create Screen"),
      ),
    );
  }
}
