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

  // Future<List<Question>> getQuestions(
  //     // {
  //     // int? numQuestions,
  //     // String? categoryId,
  //     // String? level,
  //     // }
  //     ) async {
  //   print("this is the subject category ${_read(quizSubjectProvider).state}");
  //   print("this the level of user ${_read(userControllerProvider.notifier).state.level}");
  //   print("finally the number question ${_read(quizQuestionNumberProvider)}");
  //   await _firestore
  //       .collection('questions')
  //       .where('category', isEqualTo: _read(quizSubjectProvider).state)
  //       .where('level',
  //           isEqualTo: _read(userControllerProvider.notifier).state.level)
  //       .limit(_read(quizQuestionNumberProvider).state)
  //       .get()
  //       .then((value) async {
  //     if (value.docs.isNotEmpty) {
  //       print("successfully entered the database ");

  //       value.docs.forEach((e) {
  //         final myQuestion = Question(
  //           correctAnswer: e['correct_answer'] ?? '',
  //           question: e['question'] ?? '',
  //           category: e['category'] ?? '',
  //           answers: List<String>.from(e['incorrect_answers'])
  //             ..add(e['correct_answer'] ?? '')
  //             ..shuffle(),
  //           level: e['level'] ?? '',
  //         );
  //         print(myQuestion.toString());
  //         _read(customQuizQuestionProvider.notifier).state.add(myQuestion);
  //       });
  //       print(
  //           " the state after database insertion ${_read(customQuizQuestionProvider.notifier).state.toString()}");
  //       return value.docs.map((e) {
  //         final myQuestion = new Question(
  //           correctAnswer: e['correct_answer'] ?? '',
  //           question: e['question'] ?? '',
  //           category: e['category'] ?? '',
  //           answers: List<String>.from(e['incorrect_answers'])
  //             ..add(e['correct_answer'] ?? '')
  //             ..shuffle(),
  //           level: e['level'] ?? '',
  //         );
  //         print(myQuestion.toString());
  //         return myQuestion;
  //       }).toList();
  //     } else {
  //       print("The document was not found");
  //     }
  //   });

  //   return [];
  // }

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
