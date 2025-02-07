import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/fonts.gen.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';

class TextStyleLib {
  // Text styles for the home screen
  TextStyle posterTitle = const TextStyle(
      color: SolidColors.posterTitle,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.dana,
      fontSize: 20);

  TextStyle blogItemAuthor = const TextStyle(
    color: Colors.white,
    fontFamily: FontFamily.dana,
    fontSize: 14,
  );

  TextStyle blogItemView = const TextStyle(color: Colors.white);

  TextStyle blogItemTitle = const TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.bold);

  // Text styles for specific models
  TextStyle tagTitle = const TextStyle(
      color: Colors.white,
      fontFamily: FontFamily.dana,
      fontWeight: FontWeight.bold,
      fontSize: 15);

  TextStyle miniTopic = const TextStyle(
      fontFamily: FontFamily.dana,
      fontWeight: FontWeight.bold,
      color: SolidColors.miniTopicColor,
      fontSize: 18);

  TextStyle appBarTitle = const TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: SolidColors.primaryColor,
  );

  // Text styles for the drawer
  TextStyle selectableRow = const TextStyle(
    fontFamily: FontFamily.dana,
    color: SolidColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Text styles for the profile screen
  TextStyle profileScreenUserName = const TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: SolidColors.profileScreenName);

  TextStyle profileScreenEmail = const TextStyle(
    fontFamily: FontFamily.dana,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.black,
  );

  TextStyle profileScreenButton = const TextStyle(
      fontFamily: FontFamily.dana, fontWeight: FontWeight.bold, fontSize: 18);

  // Text styles for the article list screen

  TextStyle articleListScreenItemsTitle = const TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: SolidColors.articleListItemsTitleText,
    fontWeight: FontWeight.bold,
  );

  TextStyle articleListScreenItemsAothor = const TextStyle(
    fontFamily: FontFamily.dana,
    color: SolidColors.articleListItemsAuthorText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  TextStyle articleListScreenItemsView = const TextStyle(
    fontFamily: FontFamily.dana,
    color: SolidColors.articleListItemsViewText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Text styles for the podcast list screen

  TextStyle podcastListScreenItemsTitle = const TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: SolidColors.podcastListItemsTitleText,
    fontWeight: FontWeight.bold,
  );

  TextStyle podcastListScreenItemsPublisher = const TextStyle(
    fontFamily: FontFamily.dana,
    color: SolidColors.podcastListItemsAuthorText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  TextStyle podcastListScreenItemsListen = const TextStyle(
    fontFamily: FontFamily.dana,
    color: SolidColors.podcastListItemsListenText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}