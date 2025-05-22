import 'package:expensive_app/models/expense.dart';
import 'package:expensive_app/widgets/chart/chart.dart';
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

  ];


  _openAddExpenseOverlay(){

    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (ctx) => NewExpense(onAddExpense: _addExpenses,));
  }

  void _addExpenses(Expense expense){
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense){
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense is deleted'),action: SnackBarAction(

        label: 'Undo', onPressed: (){
      setState(() {
        _registerExpenses.insert(expenseIndex, expense);
      });
    }),));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: const Text('No expenses found. Try to add some!'),
    );

    if(_registerExpenses.isNotEmpty){
      mainContent = ExpensesList(expensesList: _registerExpenses,onRemoveExpense: _removeExpenses,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registerExpenses),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
