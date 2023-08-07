import 'package:expenses_tracking_app/common_widget/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ExpensesScreen(),
    ),
  );
}
