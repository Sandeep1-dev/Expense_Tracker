import 'package:expenses_tracking_app/Models/expense.dart';
import 'package:expenses_tracking_app/common_widget/expenses_widgets/expenses_item.dart';

import 'package:flutter/material.dart';

class Expense_List extends StatelessWidget {
  const Expense_List(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: Expense_Item(
          expenses[index],
        ),
      ),
    );
  }
}
