import 'package:flutter/material.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});
  static const routeName = '/currency';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Currency"),
      ),
      body: const Center(
        child: Text("Currency Screen"),
      ),
    );
  }
}
