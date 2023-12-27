import 'package:arat_kilo/Onbording.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

//
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Onbording(),
    );
  }
}
