import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String description;
  final String uid;
  final String email;
  final String taskId;
  final datePublished;

  const Task({
    required this.email,
    required this.uid,
    required this.description,
    required this.taskId,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'description': description,
        'taskId': taskId,
        'datePublished': datePublished,
      };

  static Task fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Task(
      email: snapshot['email'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      taskId: snapshot['taskId'],
      datePublished: snapshot['datePublished'],
    );
  }
}