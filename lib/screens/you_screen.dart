import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png'),
                      backgroundColor: Colors.amber.shade300,
                      radius: 80,
                    ),
                    Positioned(
                      top: 110,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black87,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Arhant Arun Talwar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "CSE",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      "SY",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "2020bcs083@sggs.ac.in",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              const SizedBox(height: 60),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AFdZucqLrPbIVciNAe2mHWVZLW-ibHqA5IU24YIoQbjd=s288-p-rw-no'),
                backgroundColor: Colors.green.shade300,
                radius: 27,
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "TEAM VATSALYA",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Main Coordinator",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Nov 2020",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "1Yr. 8mo.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
            height: 10,
          ),
          Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Worked On",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mode_edit),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Events",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
