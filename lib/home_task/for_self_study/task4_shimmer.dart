import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Task4Shimmer extends StatelessWidget {
  const Task4Shimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shimmer')),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              loop: 5,
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
