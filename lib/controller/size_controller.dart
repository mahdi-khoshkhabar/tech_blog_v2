import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//   }
// }
class SizeController {
  final Size size;
  final Size blogItemPosterSize;
  final Size podcastItemPosterSize;
  final double bodySpaceBetween;
  final double screenPadding;
  final double tcbotWidthSize;
  final double downUpArrowWidthSize;
  final double bottomNavigationBarPaddingSize;
  final Size bottomNavigationBarBackground;
  SizeController(BuildContext context)
      : size = MediaQuery.of(context).size,
        bodySpaceBetween = MediaQuery.of(context).size.height / 20,
        bottomNavigationBarPaddingSize =
            MediaQuery.of(context).size.width / 7.3,
        bottomNavigationBarBackground = Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 8),
        screenPadding = MediaQuery.of(context).size.width / 14,
        blogItemPosterSize = Size(MediaQuery.of(context).size.width / 2.7,
            MediaQuery.of(context).size.width / 2.7),
        podcastItemPosterSize = Size(MediaQuery.of(context).size.width / 2.7,
            MediaQuery.of(context).size.width / 2.7),
        tcbotWidthSize = MediaQuery.of(context).size.width / 3.57,
        downUpArrowWidthSize = MediaQuery.of(context).size.width / 10;

  Size miniTopicSize = const Size(0, 20);
  // Size bottomNavigationSize = const Size(0, 80);
  static Size blogItemSize = const Size(150, 150);
  static Size podCastItemSize = const Size(150, 150);
}
