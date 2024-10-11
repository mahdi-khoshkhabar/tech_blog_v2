// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog_v2/my_colors.dart';
import 'package:tech_blog_v2/my_string.dart';

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 1,
      color: const Color.fromARGB(120, 70, 70, 70),
    );
  }
}

class LetsGoButton extends StatelessWidget {
  const LetsGoButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print("lets go button pressed");
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: SolidColors.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        width: size.width / 2.5,
        height: size.width / 7,
        child: Center(
          child: Text(
            MyStrings.writeScreenSingUpButtonText,
            style: const TextStyle(
                fontFamily: "dana",
                fontSize: 20,
                color: SolidColors.writeScreenSignUpButtonColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
