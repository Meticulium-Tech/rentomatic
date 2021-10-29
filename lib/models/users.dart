import 'dart:convert';

class Users {
  String? Id;
  String firstName;
  String lastName;
  String password;
  String email;
  String phoneNumber;
  DateTime birthday;
  String location;
  String? profilepic;
  Users({
    this.Id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.birthday,
    required this.location,
    this.profilepic,
  });

  Users copyWith({
    String? Id,
    String? firstName,
    String? lastName,
    String? password,
    String? email,
    String? phoneNumber,
    DateTime? birthday,
    String? location,
    String? profilepic,
  }) {
    return Users(
      Id: Id ?? this.Id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthday: birthday ?? this.birthday,
      location: location ?? this.location,
      profilepic: profilepic ?? this.profilepic,
    );
  }

  factory Users.initial() {
    return Users(
      email: 'chenxhenor@gmail.com',
      firstName: 'chendjou',
      lastName: 'honore',
      location: 'Yaounde',
      password: '123456',
      phoneNumber: '695433536',
      birthday: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': Id,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthday': birthday.millisecondsSinceEpoch,
      'location': location,
      'profilepic': profilepic,
    };
  }

  factory Users.fromMap(Map<String, dynamic>? map) {
    return Users(
      Id: map!['Id'] ?? null,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday'].millisecondsSinceEpoch),
      location: map['location'] ?? '',
      profilepic: map['profilepic'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(Id: $Id, firstName: $firstName, lastName: $lastName, password: $password, email: $email, phoneNumber: $phoneNumber, birthday: $birthday, location: $location, profilepic: $profilepic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Users &&
        other.Id == Id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.password == password &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.birthday == birthday &&
        other.location == location &&
        other.profilepic == profilepic;
  }

  @override
  int get hashCode {
    return Id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        password.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        birthday.hashCode ^
        location.hashCode ^
        profilepic.hashCode;
  }
}
