import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitize_app_v1/models/task.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Upload

  Future<String> uploadTask(
    String description,
    String title,
    String uid,
    String email,
    int daysLeft,
    DateTime date,
  ) async {
    String res = "some error occured";
    try {
      String taskId = const Uuid().v1();

      Task task = Task(
        email: email,
        uid: uid,
        description: description,
        title: title,
        taskId: taskId,
        daysLeft: daysLeft,
        date: date,
      );

      _firestore.collection('tasks').doc(taskId).set(
            task.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
