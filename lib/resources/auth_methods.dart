import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitize_app_v1/models/User.dart' as model;
import 'package:digitize_app_v1/providers/user_provider.dart';
import 'package:digitize_app_v1/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // Sign Up

  Future<String> signUpUser({
    required String firstName,
    required String lastName,
    required String email,
    required String year,
    required String branch,
    required String password,
    required String confirmPassword,
  }) async {
    String res = "Some Error Occured";
    try {
      if (firstName.isNotEmpty ||
          lastName.isNotEmpty ||
          email.isNotEmpty ||
          year.isNotEmpty ||
          branch.isNotEmpty ||
          password.isNotEmpty ||
          confirmPassword.isNotEmpty) {
        //register User

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        //Add User to database

        model.User user = model.User(
          uid: cred.user!.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          year: year,
          branch: branch,
          password: password,
          confirmPassword: confirmPassword,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );

        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "This email is badly formatted";
      } else if (err.code == "weak-password") {
        res = "Password should be at least 6 Characters ";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // loggin in user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some Error Occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please Enter Correct Info";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> addProfile({
    required Uint8List file,
  }) async {
    String res = "Some Error Occured";
    try {
      if (file.isNotEmpty) {
        // final User user = Provider.of<UserProvider>(context).getUser as User;

        String photoUrl =
            await StorageMethods().uploadImageToStorage('profilePics', file);

        // await _firestore.collection('users').doc(user.uid).set({
        //   'photoUrl': photoUrl,
        // });

        res = "success";
      }
    } catch (err) {
      final User user = _auth.currentUser!;
      final uid = user.uid;

      String photoUrl =
          await StorageMethods().uploadImageToStorage('profilePics', file);

      await _firestore.collection('users').doc(uid).set({
        'photoUrl': photoUrl,
      });
      res = err.toString();
    }
    return res;
  }
}
