import 'package:flutter/material.dart';
import 'package:manaze/screens/home/widgets/home_appbar.dart';
import 'package:manaze/screens/home/widgets/home_balance.dart';
import 'package:manaze/screens/home/widgets/home_transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const HomeAppBar(),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              HomeBalance(),
              SizedBox(height: 16),
              Expanded(child: HomeTransactions()),
            ],
          ),
        ),
      ),
    );
  }
}
