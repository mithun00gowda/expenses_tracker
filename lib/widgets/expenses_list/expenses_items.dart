import 'package:expensive_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems({super.key, required this.expenses});

  final Expense expenses;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          children: [
            Text(expenses.title),
            const SizedBox(height: 5,),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.catogry]),
                    const SizedBox(width: 4,),
                    Text(expenses.formatedDate)
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
