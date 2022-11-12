import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  //Tại sao cần dispose
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  //Hiệu thay đổi trang
  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //model.User? user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: PageView(
          children: [
            Text('Page1'),
            Text('Page2'),
            Text('Page3'),
            Text('Page4'),
            Text('Page5'),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
