import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rentomatic/providers/auth_provider.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:ms_undraw/ms_undraw.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authProvider);
    final scsvc = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Meticiculum', style: Styles.title),
        backgroundColor: Palette.secondary,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            auth.logoutUser();
            Get.off(() => SignInScreen());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UnDraw(
                illustration: UnDrawIllustration.a_better_world,
                color: Palette.light,
                height: 200,
                width: 200),
            Text(
              'soon available',
              style: Styles.title2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
      // bottomNavigationBar: ,
    );
  }
}
