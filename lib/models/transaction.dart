enum TransactionType {
  income,
  expense;

  @override
  String toString() {
    switch (this) {
      case TransactionType.income:
        return "Income";
      case TransactionType.expense:
        return "Expense";
    }
  }
}

class Transaction {}
