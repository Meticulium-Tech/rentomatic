import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomatic/controllers/controllers.dart';
import 'package:rentomatic/models/models.dart';
import 'package:rentomatic/providers/providers.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Reader _read;
  Database(this._read);


  Future<bool> createUser({required String id, required Users user}) async {
    var _id = id;
    print('successfully entered the create user method');
    try {
      await _firestore.collection("users").doc(id).set({
        'Id': user.Id,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'password': user.password,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'location': user.location,
        'profilepic': user.profilepic,
        'birthday': Timestamp.fromMillisecondsSinceEpoch(user.birthday.millisecondsSinceEpoch),
      }).then((response) => getUser(_id));
      return true;
    } on FirebaseException catch (err) {
      print('the erro found while creating user ${err.message}');
      Fluttertoast.showToast(
          msg: "Error while creating user: ${err.message}..");
      return false;
    }
  }

  Future<bool> getUser(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).get().then((doc) {
        Users _user = Users.fromMap(doc.data());
        _read(userControllerProvider.notifier).users = _user;
        print(_read(userControllerProvider.notifier).users.email);
      });
      return true;
    } on FirebaseException catch (err) {
      Fluttertoast.showToast(
        msg: "Something went wrong ${err.message}",
        backgroundColor: Palette.error,
      );
      return false;
    }
  }
}
