import 'package:digitize_app_v1/providers/user_provider.dart';
import 'package:digitize_app_v1/screens/profile_screen.dart';
import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/utils/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/User.dart' as model;

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

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _page != 0 ? Icons.home_outlined : Icons.home,
              color: blueColor,
              size: 27,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page != 1 ? Icons.check_box_outlined : Icons.check_box,
              color: blueColor,
              size: 27,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page != 2 ? Icons.add_circle_outline_outlined : Icons.add_circle,
              color: blueColor,
              size: 27,
            ),
            label: '',
            backgroundColor: mobileBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page != 3 ? Icons.list_sharp : Icons.list_sharp,
              color: blueColor,
              size: 27,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              child: Icon(
                _page != 4 ? Icons.person_outline : Icons.person,
                color: blueColor,
                size: 27,
              ),
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
