import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/view/homepage.dart';
import 'package:projeto_final_flutter/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Final - GymGuru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, secondary: Colors.black, primary: Colors.black),
        fontFamily: 'BreeSerif', 
      ),
      home: Homepage(),
    );
  }
}