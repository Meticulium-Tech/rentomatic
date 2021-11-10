import 'package:flutter_test/flutter_test.dart';
import 'package:rentomatic/models/models.dart';

void main() {
  test("Users class test", () {
    final Users user = Users(
      email: "user@example.com",
      location: "Yaounde,Messassi",
      firstName: "John",
      lastName: "James",
      phoneNumber: "6905020629",
      password: "811350",
      birthday: DateTime.now(),
    );
    expect(user.email, "user@example.com");
  });
}
