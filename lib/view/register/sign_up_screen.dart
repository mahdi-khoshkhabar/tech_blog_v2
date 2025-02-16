// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/bottom_sheets.dart';
import 'package:tech_blog_v2/model/buttons.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog_v2/components/my_string.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size spaceBetweenSize = Size(10, 25);
    Size size = MediaQuery.of(context).size;
    // builder for blog item layout on screen
    return Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: SolidColors.writeScreenBackgroundColor,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // tech robot logo
                SvgPicture.asset(
                  Assets.images.tcbot,
                  width: SizeController(context).tcbotWidthSize,
                ),
                SizedBox(
                  height: spaceBetweenSize.height,
                ),
                // welcome text
                SizedBox(
                  width: size.width / 1.5,
                  child: Text(
                    textAlign: TextAlign.center,
                    MyStrings.writeScreenWelcome,
                    style: TextStyle(
                        fontFamily: "Dana",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: SolidColors.writeScreenWelcomeTextColor),
                  ),
                ),
                SizedBox(
                  height: spaceBetweenSize.height * 5,
                ),
                // lets go button
                MyPurpleButton(
                  inputString: MyStrings.writeScreenSingUpButtonText,
                  function: () {
                    showEmailBottomSheet(context, size);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
