import 'package:flutter/material.dart';
import 'package:tech_blog_v2/my_colors.dart';

class MyPurpleButton extends StatelessWidget {
  const MyPurpleButton(
      {super.key, required, required this.inputString, required this.function});

  final String inputString;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize:
              WidgetStatePropertyAll(Size(size.width / 2.5, size.width / 7)),
          backgroundColor:
              const WidgetStatePropertyAll(SolidColors.primaryColor),
          elevation: const WidgetStatePropertyAll(0),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
          overlayColor:
              const WidgetStatePropertyAll(SolidColors.primaryOverlayColor),
          textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 20))),
      onPressed: function,
      child: Text(
        inputString,
        style: const TextStyle(
            fontFamily: "dana",
            // fontSize: 20,
            color: SolidColors.writeScreenSignUpButtonColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
