import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.food_bank_rounded,
            color: Colors.black12,
          ),
          SizedBox(width: 16),
          Expanded(child: Text("Ini Title")),
          SizedBox(width: 16),
          Text("Rp100.000"),
        ],
      ),
    );
  }
}
