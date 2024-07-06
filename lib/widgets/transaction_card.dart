import 'package:flutter/material.dart';
import 'package:manaze/helpers/currency.dart';
import 'package:manaze/helpers/date.dart';
import 'package:manaze/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction trx;
  const TransactionCard({super.key, required this.trx});

  @override
  Widget build(BuildContext context) {
    final icon = (trx.type == TransactionType.income)
        ? Icons.expand_more_rounded
        : Icons.expand_less_rounded;
    final color =
        (trx.type == TransactionType.income) ? Colors.green : Colors.red;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                icon,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trx.title.isNotEmpty ? trx.title : '-',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  trx.createdAt.toHuman(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: textTheme.labelSmall?.color?.withOpacity(.45),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              trx.amount.toHuman(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: textTheme.labelMedium?.copyWith(
                letterSpacing: .5,
                color: textTheme.labelMedium?.color?.withOpacity(.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
