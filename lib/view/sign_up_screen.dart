// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/components_model.dart';
import 'package:tech_blog_v2/my_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog_v2/my_string.dart';

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
                  width: MediaQuery.of(context).size.width / 3,
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
                LetsGoButton(size: size),
              ],
            ),
          ),
        ));
  }
}

