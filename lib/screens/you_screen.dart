import 'package:flutter/material.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("YOU"),
      ),
    );
  }
}
