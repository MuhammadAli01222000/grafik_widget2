import 'package:flutter/material.dart';

const circle = 'assets/sliver_task_img/circle.png';
const textHistory = ['About', 'Catalog', 'Price', 'Reviews', 'Location'];

class Sliver2 extends StatefulWidget {
  const Sliver2({super.key});

  @override
  State<Sliver2> createState() => _Sliver2State();
}

class _Sliver2State extends State<Sliver2> {
  final ScrollController controller = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height=250;
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

            const SelectedButton(),
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
                              SizedBox(
                                width: 85,
                                height: 85,
                                child: Card(shape: CircleBorder()),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 20,
                                child: Text(textHistory[index]),
                              ),
                            ],
                          ),
                        );
                      }, childCount: textHistory.length),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 0.5, color: Colors.grey),
            const SizedBox(height: 6),
            const AppIconsWidget(),
            const SizedBox(height: 6),
            Expanded(
              child: SizedBox(
                height: height,
                child: GestureDetector(
                  onTap: (){

                    setState(() {
                      height=400;
                    });
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(childCount: 20,(context, index) {
                          return SizedBox(
                            width: 90,
                            height: 90,
                            child: Container(color: Colors.grey.shade200),
                          );
                        }),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:const AppBottomNavigationBar(),
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

class AppIconsWidget extends StatelessWidget {
  const AppIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: SizedBox(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.apps_rounded, size: 22.5, color: Colors.grey),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_outlined,
                size: 22.5,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.assignment_ind, size: 22.5, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectedButton extends StatelessWidget {
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<String>(
          value: 'following',
          onChanged: (String? newValue) {
            print(newValue);
          },
          items: [
            DropdownMenuItem(value: 'following', child: Text('Following')),
            DropdownMenuItem(value: 'unfollowing', child: Text('Unfollowing')),
          ],
        ),

        MaterialButton(
          onPressed: () {},
          color: Colors.white,
          child: Center(child: Text("Message")),
        ),

        MaterialButton(
          onPressed: () {},
          color: Colors.white,
          child: Center(child: Text("Contact")),
        ),
        MaterialButton(
          onPressed: () {},
          color: Colors.white,
          child: Center(child: Icon(Icons.person_add_alt_outlined)),
          minWidth: 20,
        ),
      ],
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            icon: Icon(Icons.add_box_outlined, size: 25, color: Colors.black),
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
                circle,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

///yuqoridagi img va followerlari uchun
class UserImageAndFollowerInfo extends StatelessWidget {
  const UserImageAndFollowerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          const UserImageWidget(imgUrl: circle, size: 94, size2: 94),
          const Spacer(),
          const Text(
            "  999\nPosts",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          const Text(
            "  1.44K\nFollowers",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          const Text(
            " 101\nFollowing",
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
    return SizedBox(child: Row());
  }
}

///user img uchun
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
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image.asset(imgUrl, width: 94, height: 94, fit: BoxFit.cover),
      ),
    );
  }
}

///user info uchun
class WidgetInfo extends StatelessWidget {
  const WidgetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yourname Here',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              'The best solutions for your business',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              'Business Detail info here',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              'www.yoursite.com',
              style: TextStyle(fontWeight: FontWeight.w200, color: Colors.blue),
            ),
            Text(
              'Mainstreet 19, Ukraine 2200',
              style: TextStyle(fontWeight: FontWeight.w200, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
