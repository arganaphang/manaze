import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("List"),
      ),
      body: const Center(
        child: Text("List Screen"),
      ),
    );
  }
}
