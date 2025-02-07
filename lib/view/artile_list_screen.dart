import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/article_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/utils/my_string.dart';
import 'package:tech_blog_v2/utils/my_utils.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

/// Displays a list of articles.
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  // Using final for immutability.
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    double articleListItemHeight = 110; // Fixed item height

    return Scaffold(
      backgroundColor: Colors.white,
      // Custom app bar with title.
      appBar: appBar(
        title: MyStrings.articleListScreenAppBar,
        context: context,
      ),
      body: Obx(
        // Rebuilds when article list updates.
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: articleController.articleList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(34, index == 0 ? 10 : 0, 34, 34),
              child: SizedBox(
                height: articleListItemHeight,
                width: double.infinity,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    // Article image.
                    SizedBox(
                      width: articleListItemHeight,
                      child: CachedNetworkImage(
                        imageUrl: articleController.articleList[index].image!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        placeholder: (context, url) => loading(),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 27),
                    // Article details: title, view count, and author.
                    SizedBox(
                      width: SizeController(context).size.width / 2.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Article title.
                          Text(
                            articleController.articleList[index].title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyleLib().articleListScreenItemsTitle,
                          ),
                          // View count and author.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.remove_red_eye_rounded,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    articleController.articleList[index].view!,
                                    style: TextStyleLib()
                                        .articleListScreenItemsAothor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  articleController.articleList[index].author!,
                                  style: TextStyleLib()
                                      .articleListScreenItemsAothor,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
