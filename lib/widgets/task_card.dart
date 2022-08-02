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
        horizontal: 11,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1.4, color: Colors.lightBlue.shade600),
        ),
        color: mobileBackgroundColor,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snap['title'],
                style: const TextStyle(
                  fontSize: 22,
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
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Row(
                    children: const [
                      Icon(
                        Icons.people,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        "  ${4} Members Assign",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 8,
                      )
                    ],
                  ),
                  Text(
                    "${snap['daysLeft']} Days Left",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 8,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
