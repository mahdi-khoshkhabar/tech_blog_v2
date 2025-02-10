// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SolidColors {
  // AppBar colors
  static const Color appBarShadowColor = Color.fromARGB(255, 0, 0, 0);
  static const Color appBarBackgroundColor = Colors.white;
  static const Color appBarforegroundColor = Colors.black;
  static const Color appBarsurfaceTintColor = Colors.white;

  // Background colors
  static const Color writeScreenBackgroundColor = Colors.white;
  static const Color backgroundColor = Colors.white;
  static const Color splashScreenBackgroundColor = Colors.white;
  static const Color scaffoldBg = Color.fromARGB(255, 255, 255, 255);
  static const Color statusBarColor = Color.fromARGB(255, 255, 255, 255);
  static const Color systemNavigationBarColor =
      Color.fromARGB(255, 255, 255, 255);
  static const Color lightBackColor = Color.fromARGB(255, 255, 255, 255);

  // Text colors
  static const Color primaryTextColor = Color(0xFF420457);
  static const Color textTitle = Color.fromARGB(255, 0, 0, 0);
  static const Color lightText = Color.fromARGB(255, 255, 255, 255);
  static const Color subText = Color.fromARGB(255, 197, 197, 197);
  static const Color hintText = Color.fromARGB(146, 107, 107, 107);
  static const Color articleListItemsTitleText = Color.fromARGB(255, 0, 0, 0);
  static const Color podcastListItemsTitleText = Color.fromARGB(255, 0, 0, 0);
  static const Color articleListItemsAuthorText =
      Color.fromARGB(255, 97, 97, 97);
  static const Color articleListItemsViewText = Color.fromARGB(255, 97, 97, 97);
  static const Color podcastListItemsAuthorText =
      Color.fromARGB(255, 97, 97, 97);
  static const Color podcastListItemsListenText =
      Color.fromARGB(255, 97, 97, 97);
  static const Color writeScreenWelcomeTextColor =
      Color.fromARGB(255, 80, 80, 80);
  static const Color articleSinglePageTitleText = Colors.black;

  // Button colors
  static const Color profileButtonSplashColor =
      Color.fromARGB(139, 88, 39, 103);
  static const Color writeScreenSignUpButtonColor =
      Color.fromARGB(255, 255, 255, 255);

  // Icon colors
  static const Color lightIcon = Color.fromARGB(255, 255, 255, 255);
  static const Color blackColor = Color.fromARGB(255, 4, 4, 4);
  static const Color singlePageAppBarIcon = Color.fromARGB(255, 255, 255, 255);

  // Miscellaneous colors
  static const Color miniTopicColor = Color(0xFF286BB8);
  static const Color profileScreenName = Color(0xFF420457);
  static const Color posterSubTitle = Color.fromARGB(180, 255, 255, 255);
  static const Color posterTitle = Color.fromARGB(255, 255, 255, 255);
  static const Color primaryColor = Color.fromARGB(255, 68, 4, 87);
  static const Color primaryOverlayColor = Color.fromARGB(255, 98, 4, 117);
  static const Color colorTitle = Color.fromARGB(255, 40, 107, 184);
  static const Color selectedPodCast = Color.fromARGB(255, 255, 139, 26);
  static const Color submitArticle = Color.fromARGB(255, 209, 209, 209);
  static const Color submitPodCast = Color.fromARGB(255, 246, 246, 246);
  static const Color hashTagBackgroundColor = Color.fromARGB(255, 0, 0, 0);
  static const Color hashTag = Color.fromARGB(255, 255, 255, 255);
  static const Color seeMore = Color.fromARGB(255, 40, 107, 184);
  static const Color dividerColor = Color.fromARGB(255, 112, 112, 112);
  static const Color surface = Color.fromARGB(255, 242, 242, 242);
  static const Color greyColor = Color.fromARGB(255, 156, 156, 156);
  static const Color yelowColor = Color.fromARGB(255, 255, 235, 59);
  static const Color erorColor = Color.fromARGB(255, 227, 10, 10);
  static const Color minutesColorColor = Color.fromARGB(255, 203, 202, 202);
}

class GradientColors {
  // Gradient colors for various components
  static const List<Color> bottomNav = [
    Color.fromARGB(255, 25, 0, 94),
    Color.fromARGB(255, 68, 4, 87)
  ];
  static const List<Color> bottomNavBackground = [
    Color.fromARGB(0, 255, 255, 225),
    Color.fromARGB(255, 255, 255, 255),
  ];
  static const List<Color> blackTagBox = [
    Color.fromARGB(255, 0, 0, 0),
    Color.fromARGB(255, 63, 63, 63),
  ];
  // static const List<Color> favoriteTags = [
  //   Color.fromARGB(255, 0, 255, 217),
  //   Color.fromARGB(255, 255, 0, 183),
  // ];
  static const List<Color> homeScreenItemPosterColor = [
    Color.fromARGB(255, 0, 0, 0),
    Color.fromARGB(0, 0, 0, 0)
  ];
  static const List<Color> homePosterCoverGradiant = [
    Color.fromARGB(0, 0, 0, 0),
    Color.fromARGB(195, 72, 20, 88),
    Color.fromARGB(255, 28, 20, 81)
  ];
  static const List<Color> singleAppbarGradiant = [
    Color.fromARGB(255, 46, 3, 71),
    Color.fromARGB(120, 46, 3, 71),
    Colors.transparent,
  ];
}

class ListColor {
  // article list screen
  static List<Color> appBarIcon = [
    Color.fromARGB(200, 255, 255, 255),
    SolidColors.primaryColor.withAlpha(200),
  ];

  // article single page
  static List<Color> witeTagBox = [
    Color.fromARGB(200, 242, 242, 242), //background
    Colors.black, //text
  ];
}
