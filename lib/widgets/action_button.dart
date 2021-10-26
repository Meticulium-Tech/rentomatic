import 'package:flutter/material.dart';
import 'package:rentomatic/utils/utils.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final dynamic icon;
  final Color color;
  final Function callback;
  const ActionButton(
      {Key? key,
      required this.label,
      this.icon,
      required this.callback,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback,
      child: Container(
          height: 60.0,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: color, width: 2.0),
            color: Palette.secondary,
          ),
          //   gradient: Palette.gradientWith(color)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: Palette.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 3.0),
                icon ?? SizedBox.shrink(),
              ],
            ),
          )),
    );
  }
}
