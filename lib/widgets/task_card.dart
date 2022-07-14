import 'package:digitize_app_v1/utils/colors.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 25,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 2.2, color: Colors.lightBlue.shade600),
        ),
        color: mobileBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Make A Report",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 8,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Icon(
                Icons.people,
                color: Colors.grey,
                size: 22,
              ),
              const Text(
                "  ${4} Members Assign",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 8,
              ),
              const Text(
                "                     ${2} Days Left",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
