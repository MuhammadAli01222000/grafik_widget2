import 'package:flutter/material.dart';
class Code1 extends StatefulWidget {
  const Code1({super.key});

  @override
  State<Code1> createState() => _Code1State();
}

class _Code1State extends State<Code1> {
double dimens=100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: dimens,width: dimens,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(20),
            ),child: Center(child: Text("Dimens = $dimens")),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            dimens=(dimens==200)? 100:200;
          });
        },
          backgroundColor: Colors.cyanAccent,
          child: Icon(Icons.play_arrow_rounded,size: 35,color: Colors.redAccent,),),
      ),
    );
  }
}
