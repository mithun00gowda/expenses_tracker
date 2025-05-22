import 'package:expensive_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kthemcolor = ColorScheme.fromSeed(seedColor: Color.fromARGB(
    255, 96, 59, 181));
var kdarkthemeColor = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 5, 99, 125));
void main(){
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kdarkthemeColor,
      cardTheme: CardTheme().copyWith(
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
      ),
    ),
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
          fontWeight: FontWeight.bold,
          color: kthemcolor.onSecondaryContainer,
          fontSize: 15
        )
      )
    ),
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    home: Expenses(),
  ));
}