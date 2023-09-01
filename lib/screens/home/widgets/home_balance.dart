import 'package:flutter/material.dart';
import 'package:manaze/models/transaction.dart';
import 'package:manaze/widgets/icon_card.dart';

class HomeBalance extends StatelessWidget {
  const HomeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    const cs = TextStyle(
      fontSize: 14,
      color: Colors.white,
    );
    const ts = TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 120,
      decoration: BoxDecoration(
        color: Colors.indigo.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Balance", style: cs),
                    SizedBox(height: 8),
                    Text("Rp200.000", style: ts),
                  ],
                ),
                SizedBox(width: 32),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 32,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _card(TransactionType.expense, 100000),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _card(TransactionType.income, 300000),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _card(TransactionType type, double amount) {
    final c = type == TransactionType.expense ? Colors.red : Colors.green;
    const cs = TextStyle(fontSize: 10, color: Colors.white);
    const ts = TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
    return Row(
      children: [
        IconCard(color: c, icon: Icons.bar_chart),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(type.toString(), style: cs),
            const SizedBox(height: 4),
            Text("Rp$amount", style: ts),
          ],
        )
      ],
    );
  }
}
