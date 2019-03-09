import 'package:flutter/material.dart';

ThemeData theme =new ThemeData(
  primaryColor: Colors.purple,
  accentColor: Colors.blue,
  backgroundColor: Color.fromRGBO(240, 230, 2304, 1),
  textTheme: TextTheme(
    body1: TextStyle(color: Colors.black),
  ),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      
      title: TextStyle(
        color: Colors.white,
        fontSize: 20
      )
    )
  )
);