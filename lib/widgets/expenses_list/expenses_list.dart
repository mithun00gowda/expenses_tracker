import 'package:expensive_app/models/expense.dart';
import 'package:expensive_app/widgets/expenses_list/expenses_items.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList, required this.onRemoveExpense});
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expensesList.length,itemBuilder: (context,index) => Dismissible(key: ValueKey(expensesList[index]),onDismissed: (direction){
      onRemoveExpense(expensesList[index]);
    }, child: ExpensesItems(expenses: expensesList[index])));
  }
}
