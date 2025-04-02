import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Task3Rives extends StatelessWidget {
  const Task3Rives({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RiveExample());
  }
}

class RiveExample extends StatefulWidget {
  @override
  _RiveExampleState createState() => _RiveExampleState();
}

class _RiveExampleState extends State<RiveExample> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('AnimationName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.isActive = !_controller.isActive;
          });
        },
        child: const Text(
          "Press Button",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
