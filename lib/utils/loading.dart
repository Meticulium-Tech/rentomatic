import 'package:flutter/material.dart';
import 'package:rentomatic/utils/utils.dart';


class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(
        color: Palette.secondary,
      ),
    );
  }
}