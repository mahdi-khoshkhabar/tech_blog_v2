import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/app_bar_icon.dart';
import 'package:tech_blog_v2/model/fake_data.dart';
import 'package:tech_blog_v2/model/hash_tag.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/my_colors.dart';
import 'package:tech_blog_v2/view/body/home_screen.dart';
import 'package:tech_blog_v2/view/sign_up_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size blogItemPosterSize = SizeController(context).blogItemPosterSize;
    Size podCastItemPosterSize = SizeController(context).podcastItemPosterSize;
    List<BlogItem> blogitemList = [];
    List<PodcastItem> podCastItemList = [];
    List<HashTagBox> hashTagBoxList = [];
    double borderRadiusController = 20;

    // builder for blog item layout on screen
    for (int index = 0; index < FakeData().blogList.length; index++) {
      blogitemList.add(
        BlogItem(
          blogmodel: BlogModel(
              id: index,
              author: FakeData().blogList[index].author,
              blogContent: FakeData().blogList[index].blogContent,
              title: FakeData().blogList[index].title,
              poster: FakeData().blogList[index].poster,
              viewNumber: FakeData().blogList[index].viewNumber),
          posterSize: blogItemPosterSize,
          textDirection: TextDirection.ltr,
        ),
      );
    }
    // builder for podcast item layout on screen
    for (int index = 0; index < FakeData().podCastList.length; index++) {
      podCastItemList.add(PodcastItem(
        size: SizeController.podCastItemSize,
        posterSize: podCastItemPosterSize,
        podCastModel: PodCastModel(
          id: FakeData().podCastList[index].id,
          listenedNumber: FakeData().podCastList[index].listenedNumber,
          hosts: FakeData().podCastList[index].hosts,
          guests: FakeData().podCastList[index].guests,
          favoriteStatus: FakeData().podCastList[index].favoriteStatus,
          hashTags: FakeData().podCastList[index].hashTags,
          poster: FakeData().podCastList[index].poster,
          saveStatus: FakeData().podCastList[index].saveStatus,
          title: FakeData().podCastList[index].title,
        ),
      ));
    }
    //builder for hash tag box layout on screen
    for (int index = 0; index < FakeData().hashTagList.length; index++) {
      (hashTagBoxList
          .add(HashTagBox(hashTagBoxText: FakeData().hashTagList[index])));
    }
    return Scaffold(
      backgroundColor: SolidColors.backgroundColor,
      appBar: AppBar(
        // elevation: 1,
        shadowColor: SolidColors.appBarShadowColor,
        backgroundColor: SolidColors.appBarBackgroundColor,
        foregroundColor: SolidColors.appBarforegroundColor,
        surfaceTintColor: SolidColors.appBarsurfaceTintColor,
        actions: [
          AppBarIcons(
            inputIcon: Icons.menu_rounded,
            function: () {
              if (kDebugMode) {
                print("Icons.menu_rounded");
              }
            },
          ),
          Expanded(child: Assets.images.logo.image()),
          AppBarIcons(
            inputIcon: CupertinoIcons.search,
            function: () {
              if (kDebugMode) {
                print("CupertinoIcons.search");
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: HomeScreen(
                hashTagBoxList: hashTagBoxList,
                blogitemList: blogitemList,
                blogItemPosterSize: blogItemPosterSize,
                podCastItemList: podCastItemList,
                podCastItemPosterSize: podCastItemPosterSize),
          ),
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
                      borderRadius:
                          BorderRadius.circular(borderRadiusController),
                      gradient: const LinearGradient(
                          colors: GradientColors.bottomNav)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print("icons.user");
                            }
                          },
                          icon: ImageIcon(
                            Assets.icons.user.provider(),
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => const SignUpScreen()));
                            if (kDebugMode) {
                              print("icons.write");
                            }
                          },
                          icon: ImageIcon(
                            Assets.icons.write.provider(),
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("icons.home");
                          }
                        },
                        icon: ImageIcon(
                          Assets.icons.home.provider(),
                          color: Colors.white,
                        ),
                      ),
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
}
