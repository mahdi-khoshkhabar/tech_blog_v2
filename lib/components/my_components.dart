import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/article_info_model.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/text_style.dart';

Widget loading() {
  return const Center(
    child: SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 50.0,
    ),
  );
}

PreferredSizeWidget appBar({
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
        // Left arrow
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeController(context).size.width / 13.4),
              child: GestureDetector(
                onTap: backButtonOnPressed ?? () => Get.back(),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ListColor.appBarIcon[1],
                    shape: BoxShape.circle,
                  ),
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
        // Title
        Padding(
          padding:
              EdgeInsets.only(right: SizeController(context).size.width / 13.4),
          child: Text(
            title,
            style: TextStyleLib().appBarTitle,
          ),
        ),
      ],
    ),
  );
}

PreferredSizeWidget singlePageAppBar({
  ArticleInfoModel? article,
  VoidCallback? backButtonOnPressed,
  required BuildContext context,
}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 60),
    child: Container(
      height: 150,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: GradientColors.singleAppbarGradiant,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Left arrow
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeController(context).size.width / 39.4),
                  child: GestureDetector(
                    onTap: backButtonOnPressed ?? () => Get.back(),
                    child: SvgPicture.asset(
                      Assets.icons.leftArrow,
                      height: 50,
                      colorFilter: const ColorFilter.mode(
                        SolidColors.singlePageAppBarIcon,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Bookmark and Share icons
            Padding(
              padding: EdgeInsets.only(
                  right: SizeController(context).size.width / 19.7),
              child: Row(
                children: [
                  // bookmark icon
                  GestureDetector(
                    child: Assets.icons.bookmark.image(
                        color: SolidColors.singlePageAppBarIcon, width: 22),
                  ),
                  const SizedBox(width: 19.6),
                  // share icon
                  GestureDetector(
                    child: Assets.icons.share.image(
                        color: SolidColors.singlePageAppBarIcon, width: 22),
                    onTap: () async {
                      await Share.share(
                          'Check out this article: \n ${article!.title}');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
