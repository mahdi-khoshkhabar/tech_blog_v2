// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/components.dart';
import 'package:tech_blog_v2/model/fake_data.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/my_colors.dart';
import 'package:tech_blog_v2/my_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size spaceBetweenSize = Size(10, size.height / 56);
    // builder for blog item layout on screen
    return Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width / 5, 0, size.width / 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // user photo
                Image.asset(
                  Assets.images.profileAvatar.path,
                  width: size.width / 3.2,
                ),
                SizedBox(
                  height: spaceBetweenSize.height,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MiniTopic(
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
                Text(
                  "${FakeData().profileList.first.name} ${FakeData().profileList.first.lastName}",
                  style: TextStyle(
                      fontFamily: "dana",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: SolidColors.profileScreenName),
                ),
                SizedBox(
                  height: spaceBetweenSize.height / 2,
                ),
                // email
                Text(
                  FakeData().profileList.first.emailAddress,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "dana",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: spaceBetweenSize.height * 2,
                ),
                HorizontalDivider(),
                profileButton(size, MyStrings.myFavBlog, () {
                  print("MyStrings.myFavBlog");
                }),
                HorizontalDivider(),
                profileButton(size, MyStrings.myFavPodcast, () {
                  print("MyStrings.myFavPodcast");
                }),
                HorizontalDivider(),
                profileButton(size, MyStrings.logOut, () {
                  print("MyStrings.logOut");
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
          style: TextStyle(
              fontFamily: "dana", fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
