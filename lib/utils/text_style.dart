import 'package:flutter/material.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';

class TextStyleLib {
  //home screen 
  TextStyle posterTitle = const TextStyle(
      color: SolidColors.posterTitle,
      fontWeight: FontWeight.bold,
      fontFamily: "Dana",
      fontSize: 20);

  TextStyle blogItemAuthor = const TextStyle(
    color: Colors.white,
    fontFamily: "dana",
    fontSize: 14,
  );

  TextStyle blogItemView = const TextStyle(color: Colors.white);

  TextStyle blogItemTitle = const TextStyle(
      color: Colors.black,
      fontFamily: "Dana",
      fontSize: 14,
      fontWeight: FontWeight.bold);

  //specific models
  TextStyle tagTitle = const TextStyle(
      color: Colors.white,
      fontFamily: "dana",
      fontWeight: FontWeight.bold,
      fontSize: 15);

  TextStyle miniTopic = const TextStyle(
      fontFamily: "Dana",
      fontWeight: FontWeight.bold,
      color: SolidColors.miniTopicColor,
      fontSize: 18);

  //drawer
  TextStyle selectableRow = const TextStyle(
    fontFamily: "dana",
    color: SolidColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  //profile screen
  TextStyle profileScreenUserName = const TextStyle(
      fontFamily: "dana",
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: SolidColors.profileScreenName);

  TextStyle profileScreenEmail = const TextStyle(
    fontFamily: "dana",
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.black,
  );

  TextStyle profileScreenButton = const TextStyle(
      fontFamily: "dana", fontWeight: FontWeight.bold, fontSize: 18);
}
