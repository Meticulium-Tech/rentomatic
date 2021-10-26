import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:rentomatic/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final email = TextEditingController();
    final homeAddress = TextEditingController();
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Palette.secondary,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.arrow_back_sharp,
                color: Palette.primary,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Sign Up", style: Styles.title),
            ),
            Form(
              child: Container(
                width: double.infinity,
                height: 600,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  color: Palette.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Input(
                        context: context,
                        controller: name,
                        label: "name",
                        hint: "enter your name ",
                        isPassword: false,
                        type: TextInputType.name,
                        isPhone: false,
                        icon: LineIcons.user),
                    Input(
                        context: context,
                        controller: email,
                        label: "email",
                        hint: "enter your email",
                        isPassword: false,
                        type: TextInputType.emailAddress,
                        isPhone: false,
                        icon: Icons.email),
                    Input(
                        context: context,
                        controller: homeAddress,
                        label: "home Address",
                        hint: "enter your home addres ",
                        isPassword: false,
                        type: TextInputType.streetAddress,
                        isPhone: false,
                        icon: LineIcons.locationArrow),
                    Input(
                        context: context,
                        controller: passwordController,
                        label: "password",
                        hint: "enter your password",
                        isPassword: true,
                        type: TextInputType.visiblePassword,
                        isPhone: false,
                        icon: Icons.password),
                    Input(
                        context: context,
                        controller: confirmpasswordController,
                        label: "confirm password",
                        hint: "confirm your password",
                        isPassword: true,
                        type: TextInputType.visiblePassword,
                        isPhone: false,
                        icon: Icons.password),
                    ActionButton(
                        label: "Welcome",
                        callback: () {},
                        color: Palette.secondary),
                    Row(
                      children: [
                        Text("Are You having an account? "),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => SignInScreen());
                          },
                          child: Text(
                            "Sign In instead",
                            style: Styles.body,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
