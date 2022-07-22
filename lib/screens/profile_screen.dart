import 'package:digitize_app_v1/screens/club_screen.dart';
import 'package:digitize_app_v1/screens/you_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 244, 245, 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          controller: tabController,
                          labelColor: const Color.fromRGBO(43, 44, 44, 1.0),
                          unselectedLabelColor:
                              const Color.fromRGBO(108, 112, 114, 1.0),
                          indicatorColor: Colors.white,
                          indicatorWeight: 2.0,
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          tabs: const [
                            Tab(
                              text: 'You',
                            ),
                            Tab(
                              text: 'Club',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      YouScreen(),
                      ClubScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
