import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Duration duration = const Duration(seconds: 1);
  Alignment alignment = Alignment.bottomCenter;
  int count = 3;

  void _changeAlignment() {
    setState(() {
      if (alignment == Alignment(0, -0.7)) count--;

      alignment =
          alignment == Alignment(0, -0.7)
              ? Alignment.bottomCenter
              : Alignment(0, -0.7);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          count != 0
              ? Align(alignment: Alignment.topCenter, child: Box(count: count))
              : Center(
                child: Text(
                  'Game Over',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

          AnimatedAlign(
            duration: duration,
            alignment:
                count == 0 ? alignment = Alignment.centerLeft : alignment,

            curve: Curves.easeInOut,
            onEnd: () => _changeAlignment(),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              //  borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeAlignment,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.play_arrow, color: Colors.white, size: 35),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int count;
  const Box({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    const size = 100.0;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
