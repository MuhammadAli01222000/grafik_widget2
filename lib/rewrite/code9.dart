import 'package:flutter/material.dart';

class Code9 extends StatefulWidget {
  const Code9({super.key});

  @override
  State<Code9> createState() => _Code9State();
}

class _Code9State extends State<Code9> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> myAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    myAnimation = Tween<double>(begin: 0, end: 200).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

     return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: SizedBox(
            width: myAnimation.value,
            height: myAnimation.value,
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class AnimatedFlutterLogo extends AnimatedWidget {
  final Widget widget;
  AnimatedFlutterLogo({
    super.key,
    required this.widget,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final opacityTween=Tween<double>(begin: 0.1,end:  1);
    final sizeTween=Tween<double>(begin: 0,end:  300);
    final animation=listenable as Animation<double>;

return SizedBox(
  height: animation.value,
  width: animation.value,
  child:widget,
);
  }
}
