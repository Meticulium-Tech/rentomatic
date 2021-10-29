import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomatic/main.dart';
import 'package:rentomatic/models/models.dart';
import 'package:rentomatic/providers/providers.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;
  final Reader _read;
  Authentication(this._firebaseAuth, this._read);

  //track the state of authentication by a real-time listener
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //login user and provide his data to the app once done
  Future<void> loginUser({required String mail, required String pass}) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: mail, password: pass)
          .then((response) async {
        if (await _read(databaseProvider).getUser(response.user!.uid))
          Fluttertoast.showToast(
              msg: "Successful signd in", backgroundColor: Palette.success);
      });
    } on FirebaseAuthException catch (err) {
      Fluttertoast.showToast(
          msg: err.message ?? "Something went wrong !",
          backgroundColor: Palette.error);
    }
  }


  //sign up the user and store his data to firestore
  Future<void> signupUser(
      {required String mail,
      required String pass,
      required Users user}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: mail, password: pass)
          .then((response) async {
        if (await _read(databaseProvider)
            .createUser(id: response.user!.uid, user: user))
          Fluttertoast.showToast(
              msg: "Successful signed up", backgroundColor: Palette.success);
      });
    } on FirebaseAuthException catch (err) {
      Fluttertoast.showToast(
          msg: err.message ?? "Something went wrong !",
          backgroundColor: Palette.error);
    }
  }

  //simply logs out the user
  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut().then((response) => Fluttertoast.showToast(
          msg: "Successful logged out", backgroundColor: Palette.success));
    } on FirebaseAuthException catch (err) {
      Fluttertoast.showToast(
          msg: err.message ?? "Something went wrong !",
          backgroundColor: Palette.error);
    }
  }
}
