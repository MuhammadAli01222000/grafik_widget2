import 'package:flutter/material.dart';

class Code4 extends StatefulWidget {
  const Code4({super.key});

  @override
  State<Code4> createState() => _Code4State();
}

class _Code4State extends State<Code4> {
  double dimens = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: Colors.white, end: Colors.yellow),
            duration: Duration(seconds: 2),
            builder: (_, Color? value, __) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                child: const FlutterLogo(size: 200,),
              );
            },
          ),
        ),
      ),
    );
  }
}
