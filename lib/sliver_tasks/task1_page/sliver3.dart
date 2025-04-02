import 'package:flutter/material.dart';
import 'package:grafik_widget2/sliver_tasks/task1_page/sliver2.dart';

class Sliver3 extends StatefulWidget {
  const Sliver3({super.key});

  @override
  State<Sliver3> createState() => _Sliver3State();
}

class _Sliver3State extends State<Sliver3> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller=ScrollController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(child:CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(childCount: 40,(context, index) {
                return SizedBox(
                  width: 90,
                  height: 90,
                  child: Container(color: Colors.grey.shade200,child: Center(child: Text("Image $index"),),),
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
            ),
          ],
        ),),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: () {}),
          const SizedBox(width: 25),
          Text("younamehere"),
          const Spacer(),
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          const SizedBox(width: 15),
          IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {}),
        ],
      ),
    );
  }
}
