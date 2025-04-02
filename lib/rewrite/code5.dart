import 'package:flutter/material.dart';

class Code5 extends StatefulWidget {
  const Code5({super.key});

  @override
  State<Code5> createState() => _Code5State();
}

class _Code5State extends State<Code5> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double>curvedAnimtion;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
animationController=AnimationController(vsync: this,duration: Duration (seconds: 2));
curvedAnimtion=CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
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
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
           // animationController.forward();
            animationController.repeat();
          });

        },backgroundColor: Colors.redAccent,),
        body: RotationTransition(
          alignment: Alignment.topRight,
          turns: animationController,
          child: Align(
            alignment: Alignment(-1, 0.25),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/usa_backround.png'),
            ),
          ),
        ),
      ),
    );
  }
}
