import 'package:flutter/material.dart';
import 'input_file.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(

        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),


    ),
    home: MyApp(),
    
  ));
}
