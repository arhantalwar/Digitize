import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          'Tasks',
          style: TextStyle(color: secondaryColor),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return snapshot.data!.docs.length != 0
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => TaskCard(
                    snap: snapshot.data!.docs[index].data(),
                  ),
                )
              : const Center(
                  child: Text(
                    "Woohoo!!, No tasks for now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
