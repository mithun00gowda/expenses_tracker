import 'package:expensive_app/models/expense.dart';
import 'package:expensive_app/widgets/expenses_list/expenses_list.dart';
import 'package:expensive_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(title: 'Flutter Course', amount: 200, date: DateTime.now(), catogry: Category.work),
    Expense(title: 'Cinema', amount: 150, date: DateTime.now(), catogry: Category.leisure)
  ];


  _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text('Chart'),
            Expanded(child: ExpensesList(expensesList: _registerExpenses))
          ],
        ),
      ),
    );
  }
}
