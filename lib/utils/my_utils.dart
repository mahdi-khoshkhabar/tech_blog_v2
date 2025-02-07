import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

Widget loading() {
  return const Center(
    child: SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 50.0,
    ),
  );
}

appBar({
  required String title,
  VoidCallback? backButtonOnPressed,
  required BuildContext context,
}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 60),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.white.withAlpha(0),
      shadowColor: Colors.transparent,
      surfaceTintColor: SolidColors.primaryColor,
      automaticallyImplyLeading: false,
      actions: [
        //left arrow
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeController(context).size.width / 13.4),
              child: GestureDetector(
                onTap: backButtonOnPressed ?? Navigator.of(context).pop,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ListColor.appBarIcon[1], shape: BoxShape.circle),
                  child: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 40,
                    color: ListColor.appBarIcon[0],
                  ),
                ),
              ),
            ),
          ),
        ),
        //title
        Padding(
          padding:
              EdgeInsets.only(right: SizeController(context).size.width / 13.4),
          child: Text(
            title,
            style: TextStyleLib().appBarTitle,
          ),
        )
      ],
    ),
  );
}
