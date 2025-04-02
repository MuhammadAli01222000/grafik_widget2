import 'package:flutter/material.dart';

class Lesson8Task6 extends StatefulWidget {
  const Lesson8Task6({super.key});

  @override
  State<Lesson8Task6> createState() => _Lesson8Task6State();
}

class _Lesson8Task6State extends State<Lesson8Task6>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.bounceInOut),
      ),
    );

    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, ch) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.rotate(
                angle: _rotateAnimation.value,
                child: Container(
                  width: 220,
                  height: 100,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 75, top: _slideAnimation.value),
                  child: Center(
                    child: Text(
                      "Animation",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
