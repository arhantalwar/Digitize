import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String year;
  final String branch;
  final String password;
  final String confirmPassword;
  final String uid;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.year,
    required this.branch,
    required this.password,
    required this.confirmPassword,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'year': year,
        'branch': branch,
        'password': password,
        'confirmPassword': confirmPassword
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      uid: snapshot['uid'],
      year: snapshot['year'],
      branch: snapshot['branch'],
      password: snapshot['password'],
      confirmPassword: snapshot['confirmPassword'],
    );
  }
}
