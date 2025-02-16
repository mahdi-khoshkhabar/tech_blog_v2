import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_v2/controller/home_screen_controller.dart';
import 'package:tech_blog_v2/controller/list_article_controller.dart';
import 'package:tech_blog_v2/controller/single_page_article_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/model/tag_box.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_string.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/components/my_components.dart';
import 'package:tech_blog_v2/components/text_style.dart';
import 'package:tech_blog_v2/view/main%20screen/artile_list_screen.dart';
import 'package:tech_blog_v2/view/main%20screen/podcast_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.blogItemPosterSize,
    required this.podCastItemPosterSize,
  });

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final SinglePageArticleController singlePageArticleController =
      Get.put(SinglePageArticleController());
  final ListArticleController listArticleController =
      Get.put(ListArticleController());
  final ItemsBasicIngredients items = ItemsBasicIngredients();

  final Size blogItemPosterSize;
  final Size podCastItemPosterSize;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homeScreenController.isLoading.isFalse
          ? SingleChildScrollView(
              child: Column(
                children: [
                  // Poster section
                  poster(context),
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween,
                  ),
                  // Hash tag bar
                  tagBar(),
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween,
                  ),
                  // Mini topic for blogs
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeController(context).screenPadding),
                    child: MiniTopic(
                      shawIcon: true,
                      text: const Text(
                        MyStrings.viewHotestBlog,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ArticleListScreen(),
                        ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeController(context).miniTopicSize.height,
                  ),
                  // Top visited blog item bar
                  topVisitedBlogBar(context),
                  SizedBox(
                    height: SizeController(context).bodySpaceBetween,
                  ),
                  // Mini topic for podcasts
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeController(context).screenPadding),
                    child: MiniTopic(
                      shawIcon: true,
                      text: const Text(
                        MyStrings.viewHotestPodCasts,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => PodcastListScreen(),
                        ));
                      },
                    ),
                  ),

                  SizedBox(
                    height: SizeController(context).miniTopicSize.height,
                  ),
                  // Top visited podcast item bar
                  topVisitedPodcastBar(context),
                  // End of screen sized box
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
          : loading();
    });
  }

  // Poster widget
  Widget poster(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeController(context).screenPadding, 10,
          SizeController(context).screenPadding, 0),
      child: GestureDetector(
        onTap: () {
          singlePageArticleController.getArticleInfo(
              articleId: homeScreenController.poster.value.id!);
        },
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
            // Poster details
            Positioned(
              bottom: 10,
              left: 15,
              right: 15,
              child: SizedBox(
                width: SizeController(context).size.width / 1.5,
                child: Text(
                  textDirection: TextDirection.rtl,
                  homeScreenController.poster.value.title!,
                  style: TextStyleLib().posterTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Top visited podcast bar widget
  Widget topVisitedPodcastBar(BuildContext context) {
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
                  // Podcast poster
                  items.poster(
                    imageUrl: homeScreenController.topPodcasts[index].poster!,
                    size: SizeController(context).size,
                    itemPosterSize: SizeController.podCastItemSize,
                    auther: homeScreenController.topPodcasts[index].publisher,
                    ownerTextDirection: TextDirection.rtl,
                    view: homeScreenController.topPodcasts[index].view,
                    showAuthor: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  items.title(
                      Text(
                        homeScreenController.topPodcasts[index].title ??
                            MyStrings.blogItemDefaultTitle,
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

  // Top visited blog bar widget
  Widget topVisitedBlogBar(BuildContext context) {
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
              child: GestureDetector(
                onTap: () {
                  singlePageArticleController.getArticleInfo(
                      articleId: homeScreenController.topVisited[index].id!);
                },
                child: Column(
                  children: [
                    // Article poster
                    items.poster(
                      imageUrl: homeScreenController.topVisited[index].image!,
                      auther: homeScreenController.topVisited[index].author!,
                      view: homeScreenController.topVisited[index].view,
                      size: SizeController(context).size,
                      ownerTextDirection: TextDirection.rtl,
                      itemPosterSize: SizeController.blogItemSize,
                      showAuthor: true,
                      showViews: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    items.title(
                        Text(
                          homeScreenController.topVisited[index].title ??
                              MyStrings.blogItemDefaultTitle,
                          style: TextStyleLib().blogItemTitle,
                        ),
                        homeScreenController.topVisited[index].image!.length +
                            50.toDouble(),
                        null,
                        TextDirection.rtl)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Tag bar widget
  Widget tagBar() {
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
                  child: GestureDetector(
                    child:
                        BlackTagBox(tagModel: homeScreenController.tags[index]),
                    onTap: () {
                      Get.to(
                        ArticleListScreenWithTagId(
                          title: homeScreenController.tags[index].title,
                        ),
                      );
                      var tagId = homeScreenController.tags[index].id!;
                      listArticleController.getArticleListWithTagId(
                          tagId: tagId);
                    },
                  ));
            },
          )),
    );
  }
}
