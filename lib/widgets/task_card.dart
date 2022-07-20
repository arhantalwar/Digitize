import 'package:digitize_app_v1/utils/colors.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final snap;
  const TaskCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
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
          Text(
            snap['title'],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            snap['description'],
            style: const TextStyle(
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
                "${2} Days Left",
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
