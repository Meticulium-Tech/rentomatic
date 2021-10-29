import 'package:rentomatic/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserController extends StateNotifier<Users> {
  final Reader _read;
  UserController(this._read, Users users) : super(users);
  Users get users => users;
  set users(Users _users) => users = _users;
  Users getUser() {
    return users;
  }

  String test(int x) {
    return "Loremson ipsumson $x";
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, Users>(
        (ref) => UserController(ref.read, Users.initial()));
