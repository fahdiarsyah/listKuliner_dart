import 'package:flutter/material.dart';
import 'package:list_kuliner/home_page.dart';
import 'package:list_kuliner/style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: pageBgColor,
        appBar: AppBar(
          backgroundColor: headerBackColor,
          title: const Text(
            "Kuliner Semarang",
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
    );
  }
}