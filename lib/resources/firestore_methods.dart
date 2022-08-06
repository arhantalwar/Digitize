import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitize_app_v1/models/announcement.dart';
import 'package:digitize_app_v1/models/task.dart';
import 'package:digitize_app_v1/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Upload Profile

  Future<String> uploadProfile(
    Uint8List file,
  ) async {
    String res = "some error occured";
    try {
      Future<String> photoUrl =
          StorageMethods().uploadImageToStorage('profilePics', file);

      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //Upload Task

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

  // Upload Announcement

  Future<String> uploadAnnouncement(
    String description,
    String title,
    String uid,
    String email,
  ) async {
    String res = "some error occured";
    try {
      String announcementId = const Uuid().v1();

      Announcement announcement = Announcement(
        email: email,
        uid: uid,
        description: description,
        title: title,
        announcementId: announcementId,
      );

      _firestore.collection('announcement').doc(announcementId).set(
            announcement.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
