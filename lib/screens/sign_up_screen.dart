import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rentomatic/models/models.dart';
import 'package:rentomatic/providers/providers.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:rentomatic/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstName = TextEditingController();
    final lastName = TextEditingController();
    final email = TextEditingController();
    final location = TextEditingController();
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();
    final phoneNumber = TextEditingController();
    final auth = useProvider(authProvider);

    return Scaffold(
      backgroundColor: Palette.secondary,
      body: SingleChildScrollView(
        child: Padding(
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
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
                          controller: firstName,
                          label: "firstname",
                          hint: "enter your first name ",
                          isPassword: false,
                          type: TextInputType.name,
                          isPhone: false,
                          icon: LineIcons.user),
                      Input(
                          context: context,
                          controller: lastName,
                          label: "lastName",
                          hint: "enter your last name ",
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
                          controller: phoneNumber,
                          label: "phone number",
                          hint: "enter your phone number",
                          isPassword: false,
                          type: TextInputType.phone,
                          isPhone: false,
                          icon: Icons.phone_android),
                      Input(
                          context: context,
                          controller: location,
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
                          callback: () {
                            try {
                              auth.signupUser(
                                  mail: email.text,
                                  pass: passwordController.text,
                                  user: Users(
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      email: email.text,
                                      location: location.text,
                                      phoneNumber: phoneNumber.text,
                                      birthday: DateTime.now(),
                                      password: passwordController.text));
                            } on FirebaseException catch (e) {
                              e.printError();
                            } finally {
                              Get.to(() => const HomeScreen());
                            }
                          },
                          color: Palette.secondary),
                      Row(
                        children: [
                          const Text("Are You having an account? "),
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
      ),
    );
  }
}
