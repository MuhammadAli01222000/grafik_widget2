import 'package:flutter/material.dart';

class Code2 extends StatefulWidget {
  const Code2({super.key});

  @override
  State<Code2> createState() => _Code2State();
}

class _Code2State extends State<Code2> {
  double dimens = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            height: dimens,
            width: dimens,
            decoration: BoxDecoration(
              color: dimens == 100 ? Colors.indigoAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text("Dimens = $dimens")),
            onEnd: () {
              setState(() {
                dimens = (dimens == 200) ? 100 : 200;
              });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              dimens = (dimens == 200) ? 100 : 200;
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
