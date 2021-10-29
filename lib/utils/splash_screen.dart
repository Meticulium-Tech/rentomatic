import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rentomatic/utils/utils.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final pageController = PageController();
    Future<String> splashScreenTime =
        Future.delayed(const Duration(seconds: 5), () => "succeeded");
    return Scaffold(
      body: GestureDetector(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return snapshot.hasData
                ? const Root()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/animations/loading.json'),
                      Text("From L Tech", style: Styles.title2),
                    ],
                  );
          },
          future: splashScreenTime,
        ),
      ),
    );
  }
}
