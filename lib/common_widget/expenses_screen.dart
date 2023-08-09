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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(" No expense found. Try Adding Some!"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = Expense_List(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense-Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(" The chart"),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
