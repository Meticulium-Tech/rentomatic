import 'package:flutter/material.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreens extends StatelessWidget {
  const SplashScreens({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      navigateAfterSeconds: const SignInScreen(),
      seconds: 8,
      title: const Text("From L Tech"),
      backgroundColor: Palette.secondary,
      image: const Image(
        width: 30,
        height: 30,
        image: NetworkImage(
            'https://image.shutterstock.com/image-vector/building-logo-600w-566102368.jpg'),
      ),
    );
  }
}