import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rentomatic/providers/auth_provider.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:rentomatic/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class SignInScreen extends HookWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameEmailController = TextEditingController();
    final passwordController = TextEditingController();
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
                const Padding(
                  padding: EdgeInsets.only(left: 150.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://image.shutterstock.com/image-vector/building-logo-600w-566102368.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Sign In", style: Styles.title),
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
                              controller: nameEmailController,
                              label: "name or email",
                              hint: "enter your name or email",
                              isPassword: false,
                              type: TextInputType.emailAddress,
                              isPhone: false,
                              icon: LineIcons.user),
                          Input(
                              context: context,
                              controller: passwordController,
                              label: "password",
                              hint: "enter your password",
                              isPassword: true,
                              type: TextInputType.visiblePassword,
                              isPhone: false,
                              icon: Icons.password),
                          ActionButton(
                              label: "Log In",
                              callback: () {
                                try {
                                  auth.loginUser(
                                      mail: nameEmailController.text,
                                      pass: passwordController.text);
                                } on FirebaseException catch(e) {
                                  e.printError();
                                }
                               finally{
      Get.to(() => const HomeScreen());
                               }

                          
                                

                              },
                              color: Palette.secondary),
                          SizedBox(
                            height: 30,
                          ),
                          Row(children: [
                            const Text("Are You not having an account? "),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const SignUpScreen());
                              },
                              child: Text("Sign Up Now", style: Styles.body),
                            ),
                          ]),
                        ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
