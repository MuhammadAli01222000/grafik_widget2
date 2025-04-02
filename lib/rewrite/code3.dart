import 'package:flutter/material.dart';

class Code3 extends StatefulWidget {
  const Code3({super.key});

  @override
  State<Code3> createState() => _Code3State();
}

class _Code3State extends State<Code3> {
  bool onTap = false;
  double dimens = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedAlign(
            alignment: onTap ? Alignment.centerLeft : Alignment.centerRight,
            onEnd: () {
              setState(() {
                dimens = (dimens == 200) ? 100 : 200;
              });
            },
            duration: Duration(seconds: 2),
            child: Container(
              height: dimens,
              width: dimens,
              decoration: BoxDecoration(
                color: dimens == 100 ? Colors.indigoAccent : Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("Dimens = $dimens")),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              dimens = (dimens == 200) ? 100 : 200;
              onTap = !onTap;
            });
          },
          backgroundColor: Colors.cyanAccent,
          child: Icon(
            Icons.play_arrow_rounded,
            size: 35,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
