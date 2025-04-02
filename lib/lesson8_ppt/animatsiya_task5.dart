import 'package:flutter/material.dart';

class Lesson8Task5 extends StatefulWidget {
  const Lesson8Task5({super.key});

  @override
  State<Lesson8Task5> createState() => _Lesson8Task5State();
}

class _Lesson8Task5State extends State<Lesson8Task5>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _animation;
  late AnimationStatus _animationStatus;
  @override
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation =
        Tween(begin: 0.0, end: 1.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            _animationStatus = status;
          });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Transform(
            transform:
                Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(3.14 * animationController.value),
            alignment: FractionalOffset.center,
            child: Container(
              color: Colors.blueAccent,
              width: 200,
              height: 200,
              child: Icon(Icons.accessibility, color: Colors.white, size: 50),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {
            if (_animationStatus == AnimationStatus.completed) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
        ),
      ),
    );
  }
}
