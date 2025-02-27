// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/register_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/app_bar_icon.dart';
import 'package:tech_blog_v2/model/drawer.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/view/body/home_screen.dart';
import 'package:tech_blog_v2/view/body/profile_screen.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  RxInt selectedBody = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const MyDrawer(),
      backgroundColor: SolidColors.backgroundColor,
      appBar: mainScreenAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Obx(
            () => IndexedStack(
              index: selectedBody.value,
              children: [
                HomeScreen(
                    blogItemPosterSize:
                        SizeController(context).blogItemPosterSize,
                    podCastItemPosterSize:
                        SizeController(context).podcastItemPosterSize),
                const ProfileScreen(),
              ],
            ),
          )),
          //bottom navigation bar
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 140,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: GradientColors.bottomNavBackground,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    SizeController(context).bottomNavigationBarPaddingSize,
                    40,
                    SizeController(context).bottomNavigationBarPaddingSize,
                    25),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: GradientColors.bottomNav)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // home button
                      IconButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("icons.home");
                          }
                          selectedBody.value = 0;
                        },
                        icon: ImageIcon(
                          Assets.icons.home.provider(),
                          color: Colors.white,
                        ),
                      ),
                      // write button
                      IconButton(
                          onPressed: () {
                            Get.find<RegisterController>().toggleLogin();
                          },
                          icon: ImageIcon(
                            Assets.icons.write.provider(),
                            color: Colors.white,
                          )),
                      // user button
                      IconButton(
                          onPressed: () {
                            selectedBody.value = 1;
                            log(name: "MainScreen", "user button pressed");
                          },
                          icon: ImageIcon(
                            Assets.icons.user.provider(),
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar mainScreenAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      // elevation: 1,
      shadowColor: SolidColors.appBarShadowColor,
      backgroundColor: SolidColors.appBarBackgroundColor,
      foregroundColor: SolidColors.appBarforegroundColor,
      surfaceTintColor: SolidColors.appBarsurfaceTintColor,
      actions: [
        // menu botton
        AppBarIcons(
          inputIcon: Icons.menu_rounded,
          function: () {
            _key.currentState!.openDrawer();
            if (kDebugMode) {
              print("Icons.menu_rounded");
            }
          },
        ),
        Expanded(child: Assets.images.logo.image()),
        // search botton
        AppBarIcons(
          inputIcon: CupertinoIcons.search,
          function: () {
            if (kDebugMode) {
              print("CupertinoIcons.search");
            }
          },
        ),
      ],
    );
  }
}
