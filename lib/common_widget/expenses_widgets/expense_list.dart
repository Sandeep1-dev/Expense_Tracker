import 'package:expenses_tracking_app/Models/expense.dart';
import 'package:expenses_tracking_app/common_widget/expenses_widgets/expenses_item.dart';

import 'package:flutter/material.dart';

class Expense_List extends StatelessWidget {
  const Expense_List({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Expense_Item(expenses[index])
    );
  }
}
