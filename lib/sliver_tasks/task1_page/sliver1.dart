import 'package:flutter/material.dart';

class Sliver1 extends StatefulWidget {
  const Sliver1({super.key});

  @override
  State<Sliver1> createState() => _Sliver1State();
}

/// todo img url
const List<String> imgUrlHistory = [
  "assets/sliver_task_img/img_7.png",
  'assets/sliver_task_img/img_1.png',
  'assets/sliver_task_img/img_2.png',
  'assets/sliver_task_img/img_3.png',
  'assets/sliver_task_img/img_4.png',
  'assets/sliver_task_img/img_5.png',
  'assets/sliver_task_img/img_6.png',
];
const imgGrid = [
  'assets/sliver_task_img/img_1.png',
  'assets/sliver_task_img/img_2.png',
  'assets/sliver_task_img/img_3.png',
  'assets/sliver_task_img/img_4.png',
  'assets/sliver_task_img/img_5.png',
  'assets/sliver_task_img/img_6.png',
  'assets/sliver_task_img/img_1.png',
  'assets/sliver_task_img/img_2.png',
  'assets/sliver_task_img/img_3.png',
  'assets/sliver_task_img/img_4.png',
  'assets/sliver_task_img/img_5.png',
  'assets/sliver_task_img/img_6.png',
];

///history name
const List<String> nameHistory = [
  " New",
  " Sport",
  " IT",
  " Design",
  " Professor",
  " Chemistry",
  " Game Score",
];

class _Sliver1State extends State<Sliver1> {
  ///todo har biriga shart bolmasa ham controller berdim
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  final ScrollController controller3 = ScrollController();
  bool onTap = false;
  double height = 400;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const UserImageAndFollowerInfo(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: const WidgetInfo(),
            ),
            const SizedBox(height: 6),
            const EditButton(),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((
                        BuildContext context,
                        int index,
                      ) {
                        return SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              UserImageWidget(
                                imgUrl: imgUrlHistory[index],
                                size: 60,
                                size2: 60,
                              ),
                              Positioned(
                                bottom: 10,
                                child: Text(nameHistory[index]),
                              ),
                            ],
                          ),
                        );
                      }, childCount: imgUrlHistory.length),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Divider(height: 0.5, color: Colors.grey),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: SizedBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.apps_rounded,
                        size: 22.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.assignment_ind,
                        size: 22.5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],

              /// 2 ta button uchun
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  height = 500;
                },
                child: Container(
                  height: height,
                  width: double.infinity,
                  child: CustomScrollView(
                    controller: controller3,
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.all(8),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return Image.asset(
                              imgGrid[index],
                              fit: BoxFit.cover,
                            );
                          }, childCount: imgGrid.length),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded, size: 25, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded, size: 25, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_rounded,
                  size: 25,
                  color: Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/sliver_task_img/img.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock),
          Text("jacob_w"),
          IconButton(icon: Icon(Icons.expand_more_sharp), onPressed: () {}),
        ],
      ),
    );
  }
}

class UserImageAndFollowerInfo extends StatelessWidget {
  const UserImageAndFollowerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          const UserImageWidget(
            imgUrl: 'assets/sliver_task_img/img.png',
            size: 96,
            size2: 96,
          ),
          const Spacer(),
          const Text(
            "  54\nPosts",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          const Text(
            "  834\nFollowers",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          const Text(
            " 162\nFollowing",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {},
        child: Center(child: Text('Edit Profile')),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
              side: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
          ),
          elevation: WidgetStatePropertyAll(1),
          shadowColor: WidgetStatePropertyAll(Colors.grey.shade100),
          foregroundColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
    );
  }
}

class UserImageWidget extends StatelessWidget {
  final String imgUrl;
  final double size;
  final double size2;
  const UserImageWidget({
    super.key,
    required this.imgUrl,
    required this.size,
    required this.size2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(52),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image.asset(imgUrl, width: 94, height: 94, fit: BoxFit.cover),
      ),
    );
  }
}

class WidgetInfo extends StatelessWidget {
  const WidgetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("  Jacob West", style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "  Digital goodies designer ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: "@pixellz",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            "  Everything is designed",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
