import 'package:flutter/material.dart';

class Lesson8Task3 extends StatefulWidget {
  const Lesson8Task3({super.key});

  @override
  State<Lesson8Task3> createState() => _Lesson8Task3State();
}

class _Lesson8Task3State extends State<Lesson8Task3>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticIn),
    );

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
      home: Scaffold(
        body: Center(
          child: SlideTransition(
            position: animation,
            child: Padding(padding: EdgeInsets.all(16), child: FlutterLogo()),
          ),
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
