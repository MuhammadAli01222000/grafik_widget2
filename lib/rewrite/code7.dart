import 'package:flutter/material.dart';

class Code7 extends StatefulWidget {
  const Code7({super.key});

  @override
  State<Code7> createState() => _Code7State();
}

class _Code7State extends State<Code7>  with SingleTickerProviderStateMixin{
  late AnimationController animationController;
int  i=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
animationController.addListener(upDate);
animationController.forward();

  }

  void upDate(){
    i=(animationController.value*299792458).round();
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
  body: Center(child: Text("$i m/s",style:TextStyle(fontSize: 24),),),
),
    );
  }
}
