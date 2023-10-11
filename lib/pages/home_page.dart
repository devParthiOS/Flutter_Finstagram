import 'package:finstagram/pages/feed_page.dart';
import 'package:finstagram/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;
  final List<Widget> _pages = [
    FeedPage(),
    ProfilePage(),
  ];
  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text("Finstagram"),
        actions: [
          cameraActionWidget(),
          logoutActionWidget(),
        ],
      ),
      bottomNavigationBar: bottomNavigationWidget(),
      body: _pages[selectedTab],
    );
  }

  Widget cameraActionWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget logoutActionWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.logout),
      ),
    );
  }

  Widget bottomNavigationWidget() {
    return BottomNavigationBar(
        onTap: (index) {
          selectedTab = index;
          update();
          // print("$index");
        },
        currentIndex: selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: "Feed"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Profile")
        ]);
  }
}
