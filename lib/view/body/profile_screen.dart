// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/components.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_string.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size spaceBetweenSize = Size(10, size.height / 56);
    return Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width / 5, 0, size.width / 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // user photo
                Assets.images.profileAvatar.image(
                  width: size.width / 3.2,
                ),
                SizedBox(
                  height: spaceBetweenSize.height,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MiniTopic(
                    shawIcon: true,
                    text: Text(
                      MyStrings.imageProfileEdit,
                    ),
                    inputMainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                SizedBox(
                  height: spaceBetweenSize.height * 3,
                ),
                // user name
                Text("Mahdi Khoshkhabar",
                    style: TextStyleLib().profileScreenUserName),
                SizedBox(
                  height: spaceBetweenSize.height / 2,
                ),
                // email
                Text(
                  "mahdikhoshkhabar6@gmail.com",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleLib().profileScreenEmail,
                ),
                SizedBox(
                  height: spaceBetweenSize.height * 2,
                ),
                HorizontalDivider(),
                profileButton(size, MyStrings.myFavBlog, () {
                  log(name: "ProfileScreen", "${MyStrings.myFavBlog} pressed");
                }),
                HorizontalDivider(),
                profileButton(size, MyStrings.myFavPodcast, () {
                  log(
                      name: "ProfileScreen",
                      "${MyStrings.myFavPodcast} pressed");
                }),
                HorizontalDivider(),
                profileButton(size, MyStrings.logOut, () {
                  log(name: "ProfileScreen", "${MyStrings.logOut} pressed");
                }),
                SizedBox(
                  height: spaceBetweenSize.height * 4,
                )
              ],
            ),
          ),
        ));
  }

  InkWell profileButton(
      Size size, String title, GestureTapCallback gestureTapCallback) {
    return InkWell(
      splashColor: SolidColors.profileButtonSplashColor,
      onTap: gestureTapCallback,
      child: SizedBox(
        width: double.maxFinite,
        height: size.height / 15,
        child: Center(
            child: Text(
          title,
          style: TextStyleLib().profileScreenButton,
        )),
      ),
    );
  }
}
