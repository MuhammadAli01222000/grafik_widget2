import 'package:flutter/material.dart';

class HomeTask2 extends StatefulWidget {
  const HomeTask2({super.key});

  @override
  State<HomeTask2> createState() => _HomeTask2State();
}

class _HomeTask2State extends State<HomeTask2> {
  int color = 1;
  final Duration duration = const Duration(seconds: 1);
  Alignment alignmet = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.primaries[color],
        body: AnimatedAlign(
          duration: duration,
          alignment: alignmet,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.primaries[color],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: const DecorationImage(
                image: AssetImage('image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          onEnd: () {
            setState(() {
              if (alignmet == Alignment.bottomCenter) {
                color = 2;
                alignmet = Alignment.topCenter;
              } else if (alignmet == Alignment.topCenter) {
                color = 3;
                alignmet = Alignment.centerLeft;
              } else if (alignmet == Alignment.centerLeft) {
                color = 4;
                alignmet = Alignment.centerRight;
              } else if (alignmet == Alignment.bottomLeft) {
                color = 5;
                alignmet = Alignment.centerRight;
              } else if (alignmet == Alignment.centerRight) {
                alignmet = Alignment.topLeft;
                color = 6;
              } else {
                alignmet = Alignment.bottomCenter;
                color = 7;
              }
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              alignmet = Alignment.centerRight;
            });
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 35),
        ),
      ),
    );
  }
}
