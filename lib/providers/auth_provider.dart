import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:rentomatic/services/services.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
final authProvider = Provider<Authentication>((ref) {
  return Authentication(ref.read(firebaseAuthProvider), ref.read);
});

final authStateProvider = StreamProvider.autoDispose<User?>(
    (ref) => ref.watch(authProvider).authStateChanges);
