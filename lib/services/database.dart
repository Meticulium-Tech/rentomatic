import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentomatic/controllers/user_controller.dart';
import 'package:rentomatic/models/models.dart';
import 'package:rentomatic/providers/custom_quiz_question_provider.dart';
import 'package:rentomatic/providers/providers.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Reader _read;
  Database(this._read);

  Future<List<Question>> getQuestions(
      // {
      // int? numQuestions,
      // String? categoryId,
      // String? level,
      // }
      ) async {
    print("this is the subject category ${_read(quizSubjectProvider).state}");
    print("this the level of student ${_read(studentControllerProvider.notifier).state.level}");
    print("finally the number question ${_read(quizQuestionNumberProvider)}");
    await _firestore
        .collection('questions')
        .where('category', isEqualTo: _read(quizSubjectProvider).state)
        .where('level',
            isEqualTo: _read(studentControllerProvider.notifier).state.level)
        .limit(_read(quizQuestionNumberProvider).state)
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        print("successfully entered the database ");

        value.docs.forEach((e) {
          final myQuestion = Question(
            correctAnswer: e['correct_answer'] ?? '',
            question: e['question'] ?? '',
            category: e['category'] ?? '',
            answers: List<String>.from(e['incorrect_answers'])
              ..add(e['correct_answer'] ?? '')
              ..shuffle(),
            level: e['level'] ?? '',
          );
          print(myQuestion.toString());
          _read(customQuizQuestionProvider.notifier).state.add(myQuestion);
        });
        print(
            " the state after database insertion ${_read(customQuizQuestionProvider.notifier).state.toString()}");
        return value.docs.map((e) {
          final myQuestion = new Question(
            correctAnswer: e['correct_answer'] ?? '',
            question: e['question'] ?? '',
            category: e['category'] ?? '',
            answers: List<String>.from(e['incorrect_answers'])
              ..add(e['correct_answer'] ?? '')
              ..shuffle(),
            level: e['level'] ?? '',
          );
          print(myQuestion.toString());
          return myQuestion;
        }).toList();
      } else {
        print("The document was not found");
      }
    });

    return [];
  }

  Future<bool> createUser(
      {required String id, required Student student}) async {
    var _id = id;
    try {
      await _firestore.collection("students").doc(id).set({
        'id': student.id,
        'names': student.names,
        'section': student.section,
        'email': student.email,
        'phone': student.phone,
        'school': student.school,
        'level': student.level,
        'avatar': student.avatar,
        'achievements': student.achievements,
        'subjects': student.subjects,
        'prenium': student.prenium,
        'birthdate': student.birthdate,
      }).then((response) => getUser(_id));
      return true;
    } on FirebaseException catch (err) {
      Fluttertoast.showToast(
          msg: "Error while creating user: ${err.message}..");
      return false;
    }
  }

  Future<bool> getUser(String uid) async {
    try {
      await _firestore.collection('students').doc(uid).get().then((doc) {
        Student _student = Student.fromDocumentSnapshot(doc.data());
        _read(studentControllerProvider.notifier).student = _student;
        print(_read(studentControllerProvider.notifier).student.email);
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
