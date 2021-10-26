import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentomatic/screens/screens.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:rentomatic/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameEmailController = TextEditingController();
    final passwordController = TextEditingController();
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
                            callback: () {},
                            color: Palette.secondary),
                        Row(children: [
                          const Text("Are You not having an account? "),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpScreen());
                            },
                            child: const Text("Sign Up Now"),
                          ),
                        ]),
                      ]),
                ),
              ),
            ]),
      ),
    );
  }
}
