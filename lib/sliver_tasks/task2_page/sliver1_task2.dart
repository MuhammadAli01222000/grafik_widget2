import 'package:flutter/material.dart';

///img url
const mebelStolStulImgUrl = [
  "assets/mebel_shop/stol_stul/img.png",
  "assets/mebel_shop/stol_stul/img_1.png",
  "assets/mebel_shop/stol_stul/img_2.png",
  "assets/mebel_shop/stol_stul/img_3.png",
  "assets/mebel_shop/stol_stul/img_4.png",
];
const mebelDivanImgUrl = [
  'assets/mebel_shop/img.png',
  'assets/mebel_shop/img_1.png',
  'assets/mebel_shop/img_2.png',
  'assets/mebel_shop/img_3.png',
  'assets/mebel_shop/img_4.png',
];
const kresloImgUrl = [
  'assets/mebel_shop/kreslo/img.png',
  'assets/mebel_shop/kreslo/img_1.png',
  'assets/mebel_shop/kreslo/img_2.png',
  'assets/mebel_shop/kreslo/img_3.png',
  'assets/mebel_shop/kreslo/img_4.png',
  'assets/mebel_shop/kreslo/img_5.png',
];

class Sliver1Task2 extends StatefulWidget {
  const Sliver1Task2({super.key});

  @override
  State<Sliver1Task2> createState() => _Sliver1Task2State();
}

class _Sliver1Task2State extends State<Sliver1Task2> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Furniture"), centerTitle: false),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 190,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  ///divan img uchun
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: mebelDivanImgUrl.length,
                      (context, index) {
                        return Container(
                          width: 300,
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 280,
                                height: 120,
                                child: Card(
                                  child: Image.asset(
                                    mebelDivanImgUrl[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "  Orange Sofia",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    r"  $120.0",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shopping_cart_checkout_sharp,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            const Text(
              "Styled Chairs",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            ///qora nuqtalar
            SizedBox(
              height: 30,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var o = 0; o < mebelStolStulImgUrl.length; o++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: Card(color: Colors.black, shape: CircleBorder()),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ///stul uchun grid
            SizedBox(
              height: 150,
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  for (var o in mebelStolStulImgUrl)
                    Image.asset(o, fit: BoxFit.cover, width: 60, height: 60),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ///kreslo sliver
            SizedBox(
              height: 300,
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: kresloImgUrl.length,
                      (context, index) {
                        return Card(
                          child: Image.asset(
                            kresloImgUrl[index],
                            fit: BoxFit.cover,
                            width: 290,
                            height: 80,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
