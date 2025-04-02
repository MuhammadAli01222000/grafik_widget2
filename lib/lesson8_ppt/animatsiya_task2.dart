import 'package:flutter/material.dart';

class Lesson8Task2 extends StatefulWidget {
  const Lesson8Task2({super.key});

  @override
  State<Lesson8Task2> createState() => _Lesson8Task2State();
}

class _Lesson8Task2State extends State<Lesson8Task2> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation=Tween<Size>(begin: Size(100, 100),end: Size(120, 120)).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
    animationController.addStatusListener( (AnimationStatus status){
      if(status==AnimationStatus.completed){
        animationController.repeat();
      }
    }
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter Animations",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: AnimatedBuilder(animation: animation,
              builder: (context,child){
            return Container(
              width: animation.value.width,height: animation.value.height,
            child: Image.asset('assets/self_study/usa_backround.png'),
            );
              })
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            animationController.forward();
          },
          backgroundColor: Colors.cyanAccent,
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
