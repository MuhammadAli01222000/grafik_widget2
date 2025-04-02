import 'package:flutter/material.dart';

class HomeTask4 extends StatefulWidget {
  const HomeTask4({super.key});

  @override
  State<HomeTask4> createState() => _HomeTask4();
}

class _HomeTask4 extends State<HomeTask4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: Container(
              width: 100,
              height: 100,
              child: Image.asset("assets/image.png"),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            if (_controller.isAnimating) {
              _controller.stop();
            } else {
              _controller.repeat(reverse: true);
            }
            setState(() {});
          },
          child: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}
