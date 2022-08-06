import 'package:flutter/material.dart';

class ClubScreen extends StatefulWidget {
  const ClubScreen({Key? key}) : super(key: key);

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Club"),
      ),
    );
  }
}
