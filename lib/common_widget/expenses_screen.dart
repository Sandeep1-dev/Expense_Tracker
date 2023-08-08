import 'package:expenses_tracking_app/Models/expense.dart';
import 'package:expenses_tracking_app/common_widget/expenses_widgets/expense_list.dart';
import 'package:expenses_tracking_app/common_widget/new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Books",
        amount: 3520,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Pizza",
        amount: 750,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Goa",
        amount: 5800,
        date: DateTime.now(),
        category: Category.travel)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense-Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(" The chart"),
            Expanded(
              child: Expense_List(expenses: _registeredExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
