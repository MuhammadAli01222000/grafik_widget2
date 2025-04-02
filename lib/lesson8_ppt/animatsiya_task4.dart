import 'package:flutter/material.dart';

class Lesson8Task4 extends StatefulWidget {
  const Lesson8Task4({super.key});

  @override
  State<Lesson8Task4> createState() => _Lesson8Task4State();
}

class _Lesson8Task4State extends State<Lesson8Task4>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _sliderAnimation;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _sliderAnimation = Tween(begin: 200.0, end: 120.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticIn),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
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
        body: AnimatedBuilder(
          animation: _sliderAnimation,
          builder: (ctx, ch) {
            return Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: _sliderAnimation.value, left: 125),
              child: Center(child: Image.asset('assets/img.png')),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          onPressed: () {
            setState(() {});
          },
          child: Icon(Icons.play_arrow_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
