// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_v2/controller/home_screen_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_string.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/utils/my_utils.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.blogItemPosterSize,
    required this.podCastItemPosterSize,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ItemsBasicIngredients items = ItemsBasicIngredients();

  final Size blogItemPosterSize;
  final Size podCastItemPosterSize;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homeScreenController.isLoading.isFalse
          ? SingleChildScrollView(
            child: Column(
                children: [
                  poster(context),
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween,
                  ),
                  // hash tag bar
                  hashtagBar(),
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween,
                  ),
                  //mini topic for blogs
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeController(context).screenPadding),
                    child: const MiniTopic(
                      text: Text(
                        MyStrings.viewHotestBlog,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeController(context).miniTopicSize.height,
                  ),
                  //top visited blog item bar
                  topVisitedBlogItemBar(context),
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween,
                  ),
                  //mini topic for podcasts
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeController(context).screenPadding),
                    child: const MiniTopic(
                      text: Text(
                        MyStrings.viewHotestPodCasts,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeController(context).miniTopicSize.height,
                  ),
                  //top visited podcast item bar
                  topVisitedPodcastItemBar(context),
                  // end of screen sized box
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween +
                        SizeController(context)
                            .bottomNavigationBarBackground
                            .height,
                    width: SizeController(context)
                        .bottomNavigationBarBackground
                        .width,
                  ),
                ],
              ),
          )
          :  loading();
    });
  }

  Widget poster(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeController(context).screenPadding, 10,
          SizeController(context).screenPadding, 0),
      child: Stack(
        children: [
          Container(
            height: SizeController(context).size.height / 4.5,
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: GradientColors.homePosterCoverGradiant)),
            child: CachedNetworkImage(
              imageUrl: homeScreenController.poster.value.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: GradientColors.homeScreenItemPosterColor,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                );
              },
              placeholder: (context, url) {
                return const SpinKitFadingCube(
                  color: SolidColors.primaryColor,
                  size: 50.0,
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: GradientColors.homeScreenItemPosterColor,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.black,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          //poster details
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: SizedBox(
              child: Column(
                children: [
                  //title
                  SizedBox(
                    width: SizeController(context).size.width / 1.5,
                    child: Text(
                      textDirection: TextDirection.rtl,
                      homeScreenController.poster.value.title!,
                      style: const TextStyle(
                          color: SolidColors.posterTitle,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Dana",
                          fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topVisitedPodcastItemBar(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeController(context).size.height / 4,
        child: ListView.builder(
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.fromLTRB(
                      SizeController(context).screenPadding, 0, 16, 0)
                  : const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Column(
                children: [
                  //podcast poster
                  items.poster(
                      homeScreenController.topPodcasts[index].poster!,
                      SizeController(context).size,
                      SizeController.podCastItemSize,
                      homeScreenController.topPodcasts[index].author,
                      homeScreenController.topPodcasts[index].view,
                      TextDirection.rtl,
                      showAuthor: true),
                  // items.poster(
                  //   homeScreenController.topPodcasts[index].poster!,
                  //   SizeController(context).size,
                  //   SizeController.podCastItemSize,
                  //   homeScreenController.topPodcasts[index].publisher!,
                  //   homeScreenController.topPodcasts[index].view,
                  //   TextDirection.rtl,
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  items.title(
                      Text(
                        homeScreenController.topPodcasts[index].title ??
                            MyStrings.blogItemDefaultTitle,
                        style: const TextStyle(
                            fontFamily: "Dana",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      null,
                      null,
                      TextDirection.ltr)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topVisitedBlogItemBar(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeController(context).size.height / 4,
        child: ListView.builder(
          itemCount: homeScreenController.topVisited.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.fromLTRB(
                      SizeController(context).screenPadding, 0, 16, 0)
                  : const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Column(
                children: [
                  //article poster
                  items.poster(
                      homeScreenController.topVisited[index].image!,
                      SizeController(context).size,
                      SizeController.blogItemSize,
                      homeScreenController.topVisited[index].author!,
                      homeScreenController.topVisited[index].view,
                      TextDirection.rtl,
                      showAuthor: true,
                      showViews: true),
                  const SizedBox(
                    height: 8,
                  ),
                  items.title(
                      Text(
                        homeScreenController.topVisited[index].title ??
                            MyStrings.blogItemDefaultTitle,
                        style: const TextStyle(
                          fontFamily: "Dana",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      homeScreenController.topVisited[index].image!.length +
                          50.toDouble(),
                      null,
                      TextDirection.rtl)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget hashtagBar() {
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            itemCount: homeScreenController.tags.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? EdgeInsets.fromLTRB(
                        SizeController(context).screenPadding, 0, 16, 0)
                    : const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: GradientColors.tags,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.tag,
                          color: Colors.white,
                          size: 18,
                        ),
                        // const SizedBox(
                        //   width: 8,
                        // ),
                        Text(
                          textAlign: TextAlign.center,
                          homeScreenController.tags[index].title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "dana",
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
