// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/home_screen_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/main_screen_poster.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_string.dart';
import 'package:get/get.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          //main screen poster
          MainScreenPoster(
              size: SizeController(context).size,
              articleModel: ArticleModel(
                id: "0",
                author: "Mahdi Khoshkhabar",
                catId: "02",
                catName: "AI",
                createdAt: "12/10/2024",
                image:
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdeveloper.nvidia.com%2Fblog%2Fopenai-presents-gpt-3-a-175-billion-parameters-language-model%2F&psig=AOvVaw3rYrP2vJClepN9cFNaE4eX&ust=1738351711051000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLDUwfeWnosDFQAAAAAdAAAAABAE",
                title: "What is artificial intelligence (AI)?",
                view: "2645",
              )),
          SizedBox(
            height: SizeController(context).bodySpaceBetween,
          ),
          // hash tag bar
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Obx(() {
                return ListView.builder(
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
                );
              }),
            ),
          ),

          SizedBox(
            height: SizeController(context).bodySpaceBetween,
          ),
          //mini topic for blogs
          Padding(
            padding:
                EdgeInsets.only(left: SizeController(context).screenPadding),
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
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: SizeController(context).size.height / 4,
              child: Obx(() {
                return ListView.builder(
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
                              SizeController(context).size,
                              const Size(150, 150),
                              Image.network(homeScreenController
                                  .topVisited[index].image!),
                              homeScreenController.topVisited[index].author
                                  .toString(),
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
                              homeScreenController
                                      .topVisited[index].image!.length +
                                  50.toDouble(),
                              null,
                              TextDirection.rtl)
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
          SizedBox(
            height: SizeController(context).bodySpaceBetween,
          ),
          //mini topic for podcasts
          Padding(
            padding:
                EdgeInsets.only(left: SizeController(context).screenPadding),
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
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: SizeController(context).size.height / 4,
              child: Obx(() {
                return ListView.builder(
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
                              SizeController(context).size,
                              SizeController(context).podcastItemPosterSize,
                              Image.network(homeScreenController
                                  .topPodcasts[index].poster!),
                              homeScreenController.topPodcasts[index].publisher
                                  .toString(),
                              homeScreenController.topPodcasts[index].view,
                              TextDirection.rtl),
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
                );
              }),
            ),
          ),
          /*
          ItemBar(
            itemBarObjectList: homeScreenController.topPodcasts,
            itemSize: Size(
                podCastItemPosterSize.width, podCastItemPosterSize.height + 50),
            itemCount: 5,
            voidCallback: () {},
          ),
          */
          // end of screen sized box
          SizedBox(
            height: SizeController(context).bodySpaceBetween +
                SizeController(context).bottomNavigationBarBackground.height,
            width: SizeController(context).bottomNavigationBarBackground.width,
          ),
        ],
      ),
    );
  }
}
