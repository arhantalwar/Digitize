import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  final String description;
  final String title;
  final String uid;
  final String email;
  final String announcementId;

  const Announcement({
    required this.email,
    required this.uid,
    required this.description,
    required this.announcementId,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'description': description,
        'announcementId': announcementId,
        'title': title,
      };

  static Announcement fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Announcement(
      email: snapshot['email'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      announcementId: snapshot['announcementId'],
      title: snapshot['title'],
    );
  }
}
