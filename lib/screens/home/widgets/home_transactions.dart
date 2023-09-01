import 'package:flutter/material.dart';
import 'package:manaze/widgets/transaction_card.dart';

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, idx) {
        return const TransactionCard();
      },
      separatorBuilder: (ctx, idx) {
        return Container(
          height: .5,
          decoration: const BoxDecoration(color: Colors.black12),
        );
      },
      itemCount: 100,
    );
  }
}
