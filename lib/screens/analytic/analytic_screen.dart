import 'package:flutter/material.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});
  static const routeName = '/analytic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Analytic"),
      ),
      body: const Center(
        child: Text("Analytic Screen"),
      ),
    );
  }
}
