import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String description;
  final String title;
  final String uid;
  final String email;
  final String taskId;
  final int daysLeft;
  final DateTime date;

  const Task({
    required this.email,
    required this.uid,
    required this.description,
    required this.taskId,
    required this.title,
    required this.daysLeft,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'description': description,
        'taskId': taskId,
        'title': title,
        'daysLeft': daysLeft,
        'date': date,
      };

  static Task fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Task(
      email: snapshot['email'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      taskId: snapshot['taskId'],
      title: snapshot['title'],
      daysLeft: snapshot['daysLeft'],
      date: snapshot['date'],
    );
  }
}
