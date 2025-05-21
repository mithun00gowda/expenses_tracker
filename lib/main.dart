import 'package:expensive_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kthemcolor = ColorScheme.fromSeed(seedColor: Color.fromARGB(
    255, 252, 101, 2));
void main(){
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
    colorScheme: kthemcolor,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kthemcolor.onPrimaryContainer,
        foregroundColor: kthemcolor.primaryContainer
      ),
      cardTheme: CardTheme().copyWith(
        color: kthemcolor.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kthemcolor.primaryContainer
        )
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          color: kthemcolor.onSecondaryContainer,
          fontSize: 14
        )
      )
    ),
    home: Expenses(),
  ));
}