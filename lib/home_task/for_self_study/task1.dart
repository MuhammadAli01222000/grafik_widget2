import 'package:flutter/material.dart';



///img path
const usa="assets/self_study/usa.png";
const usaBackround='assets/self_study/usa_backround.png';
const military='assets/self_study/military.png';
const militaryBackround='assets/self_study/img.png';
const superMan='assets/self_study/s.png';
const superManBAckround='assets/self_study/img_1.png';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(title: const Text('First Page')),
        body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
          controller: ScrollController(),
          child: Column(
      
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width-2,
                height: MediaQuery.sizeOf(context).height-2,
                decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage("assets/self_study/img_2.png"),fit: BoxFit.fitWidth)
                ),
                child:  Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///1 page
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondPage()),
                          );
                        },
                        child: Hero(
                          tag: 'hero1',
                          child: Container(
                              child: Image.asset(usa, width: 200, height: 400)),
                        ),
                      ),
                      SizedBox(width: 10,),
                     ///page
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Page3()),
                          );
                        },
                        child: Hero(
                          tag: 'hero2',
                          child: Container(
                              child: Image.asset(military, width: 200, height: 400)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Page4()),
                          );
                        },
                        child: Hero(
                          tag: 'hero3',
                          child: Container(
                              child: Image.asset(superMan, width: 200, height: 400)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      
            ],
          ),
        ),

    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width-2,
              height: MediaQuery.sizeOf(context).height-2,
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage(usaBackround),fit: BoxFit.fitWidth)
              ),
            ),
            Center(
              child: Hero(
                tag: 'hero1',
                child: ClipOval(child: Image.asset(usa, width: 300, height: 300)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
///2 gero


class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' Page3')),
      body: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width-2,
              height: MediaQuery.sizeOf(context).height-2,
              decoration: BoxDecoration(
                  image: DecorationImage(image:AssetImage(militaryBackround),fit: BoxFit.fitWidth)
              ),
            ),
            Center(
              child: Hero(
                tag: 'hero2',
                child: ClipOval(child: Image.asset(military, width: 300, height: 300)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
///3 gero


class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page4')),
      body: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width-2,
              height: MediaQuery.sizeOf(context).height-2,
              decoration: BoxDecoration(
                  image: DecorationImage(image:AssetImage(superManBAckround),fit: BoxFit.fitWidth)
              ),
            ),
            Center(
              child: Hero(
                tag: 'hero3',
                child: ClipOval(child: Image.asset(superMan, width: 300, height: 300)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
