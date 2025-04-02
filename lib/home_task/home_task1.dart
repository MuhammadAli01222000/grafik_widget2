import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Duration duration = const Duration(seconds: 1);
  Alignment alignmet = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedAlign(
          duration: duration,
          alignment: alignmet,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('img_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          onEnd: () {
            setState(() {
              if (alignmet == Alignment.bottomCenter) {
                alignmet = Alignment.topCenter;
              } else if (alignmet == Alignment.topCenter) {
                alignmet = Alignment.centerLeft;
              } else if (alignmet == Alignment.centerLeft) {
                alignmet = Alignment.centerRight;
              } else if (alignmet == Alignment.bottomLeft) {
                alignmet = Alignment.centerRight;
              } else if (alignmet == Alignment.centerRight) {
                alignmet = Alignment.topLeft;
              } else {
                alignmet = Alignment.bottomCenter;
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
