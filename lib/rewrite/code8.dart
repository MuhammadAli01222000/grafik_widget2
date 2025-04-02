import 'package:flutter/material.dart';

class Code8 extends StatefulWidget {
  const Code8({super.key});

  @override
  State<Code8> createState() => _Code8State();
}

class _Code8State extends State<Code8> with SingleTickerProviderStateMixin {
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
      home:Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: SizedBox(width:myAnimation.value,height: myAnimation.value,child:const FlutterLogo(),),
        ),
      )
    );
  }
}
