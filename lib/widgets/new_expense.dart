import 'package:flutter/material.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate ;
  Category? selectedCategory;


  void datePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1,now.month,now.day);
    // final lastDate = DateTime(now.year - 1);
   final pickedDate =  await showDatePicker(context: context,initialDate: now, firstDate: firstDate, lastDate: now);
   setState(() {
     _selectedDate = pickedDate;
   });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),child: Column(
      children: [
        TextField(
          controller: titleController,
          maxLength: 50,
          decoration: InputDecoration(
            label: Text('Title'),
          ),
        ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(child:  TextField(
             controller: amountController,
             maxLength: 50,
             keyboardType: TextInputType.number,

             decoration: InputDecoration(
               prefixText: '\$ ',
               label: Text('Amount'),
             ),
           ),),
           SizedBox(width: 16,),
           Expanded(child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Text(_selectedDate == null ?'Selected Date':formater.format(_selectedDate!)),
               IconButton(onPressed: datePicker, icon: Icon(Icons.calendar_month))
             ],
           ))
         ],
       ),
        SizedBox(height: 14,),
        Row(
          children: [
            DropdownButton(
                value: selectedCategory,
                items: Category.values.map((categorys) => DropdownMenuItem(
                value: categorys,
                child: Text(categorys.name.toUpperCase()))).toList(), onChanged: (value){
              print(value);
              if(value == null){
                return;
              }
              setState(() {
                selectedCategory = value;
              });
            }),
            const Spacer(),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancel')),
            ElevatedButton(onPressed: (){
              print(titleController.text);
              print(amountController.text);
            }, child: const Text('Save Expense'))
          ],
        )
      ],
    ),);
  }
}
