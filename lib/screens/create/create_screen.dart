import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});
  static const routeName = '/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create"),
      ),
      body: const Center(
        child: Text("Create Screen"),
      ),
    );
  }
}
