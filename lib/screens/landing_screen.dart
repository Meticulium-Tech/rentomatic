import 'package:flutter/material.dart';
import 'package:l_tech/utils/utils.dart';
import 'package:rentomatic/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameEmailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Palette.secondary,
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://image.shutterstock.com/image-vector/building-logo-260nw-566102368.jpg"),
              radius: 50,
            ),
            Text(
              "from L TECH",
              style: Styles.title,
            ),
          ],
        ),
      ),
    );
  }
}
