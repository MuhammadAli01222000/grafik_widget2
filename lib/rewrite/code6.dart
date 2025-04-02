import 'package:flutter/material.dart';

class Code6 extends StatefulWidget {
  const Code6({super.key});

  @override
  State<Code6> createState() => _Code6State();
}

class _Code6State extends State<Code6>  with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> myAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
  myAnimation=Tween<Offset>(begin: Offset( -0.75,-0.75),end: Offset(0.75,0.75) ).animate(animationController);
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
body: Center(
 child: SlideTransition(position:myAnimation,child:const FlutterLogo(), ),
),      floatingActionButton: FloatingActionButton(onPressed: (){animationController.forward();},child: Icon(Icons.play_arrow_rounded,color: Colors.white,),),),
    );
  }
}
