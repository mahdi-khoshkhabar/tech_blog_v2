// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/bottom_sheets.dart';
import 'package:tech_blog_v2/model/buttons.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_string.dart';

class EmpthyProfileScreen extends StatelessWidget {
  const EmpthyProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // builder for blog item layout on screen
    return Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width / 5, 0, size.width / 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SvgPicture.asset(
                    Assets.images.tcbot,
                    width: SizeController(context).tcbotWidthSize,
                  ),
                ),
                Text(
                  MyStrings.profileNotFound,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "dana",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: SolidColors.primaryTextColor),
                ),
                MyPurpleButton(
                    inputString: "Lets Go",
                    function: () {
                      showEmailBottomSheet(context, size);
                    })
              ],
            ),
          ),
        ));
  }
}
