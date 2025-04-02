import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:
              test
                  ? Lottie.asset(
                    'assets/animation/Animation - 1741689346977 (1).json',
                  )
                  : Text(
                    "PRESS FAB",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              test = !test;
            });
          },
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }
}
