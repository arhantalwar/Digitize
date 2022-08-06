import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitize_app_v1/providers/user_provider.dart';
import 'package:digitize_app_v1/resources/auth_methods.dart';
import 'package:digitize_app_v1/resources/firestore_methods.dart';
import 'package:digitize_app_v1/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  Uint8List? _file;

  // void selectImage() async {
  //   Uint8List im = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = im;
  //   });
  // }

  void addProfile(
    String uid,
  ) async {
    try {
      String res = await FirestoreMethods().uploadProfile(
        _file!,
      );

      if (res == 'success') {
        showSnackBar("Uploaded", context);
      } else {
        showSnackBar(res, context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  void selectProfile() async {
    Uint8List file = await pickImage(
      ImageSource.gallery,
    );

    setState(() {
      _file = file;
    });

    // String res = await AuthMethods().addProfile(file: _image!);

    // if (res != "success") {
    //   // ignore: use_build_context_synchronously
    //   showSnackBar(res, context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

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
                    _file != null
                        ? CircleAvatar(
                            backgroundImage: MemoryImage(_file!),
                            backgroundColor: Colors.amber.shade300,
                            radius: 80,
                          )
                        : CircleAvatar(
                            backgroundImage: const NetworkImage(
                                'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png'),
                            backgroundColor: Colors.amber.shade300,
                            radius: 80,
                          ),
                    Positioned(
                        top: 110,
                        right: 0,
                        child: _file == null
                            ? IconButton(
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black87,
                                ),
                                onPressed: selectProfile,
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.black87,
                                ),
                                onPressed: () => addProfile(user.uid),
                              )),
                  ],
                ),
                const SizedBox(height: 30),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    return Column(
                      children: [
                        Text(
                          snapshot.data!.docs[1].data()['firstName'] +
                              " " +
                              snapshot.data!.docs[1].data()['lastName'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.docs[1]
                                  .data()['branch']
                                  .toString()
                                  .toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 50),
                            Text(
                              snapshot.data!.docs[1]
                                  .data()['year']
                                  .toString()
                                  .toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          snapshot.data!.docs[1].data()['email'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  },
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
                backgroundImage: const NetworkImage(
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
