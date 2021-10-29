import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rentomatic/providers/providers.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';

class Root extends HookWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = useProvider(authStateProvider);
    return user.when(
        loading: () => const Scaffold(body: Loading()),
        error: (_, __) => const SignUpScreen(),
        data: (authenticatedUser) =>
            authenticatedUser != null ? const HomeScreen() : const SignInScreen());
  }
}
