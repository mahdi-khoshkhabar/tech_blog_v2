import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/list_article_controller.dart';
import 'package:tech_blog_v2/controller/single_page_article_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_string.dart';
import 'package:tech_blog_v2/components/my_components.dart';
import 'package:tech_blog_v2/components/text_style.dart';
import 'package:tech_blog_v2/view/main%20screen/article_single_page.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  final ListArticleController listaAticleController =
      Get.put(ListArticleController());
  final SinglePageArticleController singlePageArticleController =
      Get.put(SinglePageArticleController());
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
        () => listaAticleController.articleList.isEmpty
            ? loading()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listaAticleController.articleList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(34, index == 0 ? 10 : 0, 34, 34),
                    child: GestureDetector(
                      onTap: () {
                        singlePageArticleController.getArticleInfo(
                            articleId:
                                listaAticleController.articleList[index].id!);
                      },
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
                                imageUrl: listaAticleController
                                    .articleList[index].image!,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Article title.
                                  Text(
                                    listaAticleController
                                        .articleList[index].title!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyleLib()
                                        .articleListScreenItemsTitle,
                                  ),
                                  // View count and author.
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.remove_red_eye_rounded,
                                            size: 20,
                                            color: SolidColors
                                                .articleListItemsViewText,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            listaAticleController
                                                .articleList[index].view!,
                                            style: TextStyleLib()
                                                .articleListScreenItemsView,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          listaAticleController
                                              .articleList[index].author!,
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
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class ArticleListScreenWithTagId extends StatelessWidget {
  ArticleListScreenWithTagId({super.key, this.title});
  final String? title;
  final ListArticleController listaAticleController =
      Get.put(ListArticleController());
  final SinglePageArticleController singlePageArticleController =
      Get.put(SinglePageArticleController());

  @override
  Widget build(BuildContext context) {
    double articleListItemHeight = 110; // Fixed item height
    return Scaffold(
      backgroundColor: Colors.white,
      // Custom app bar with title.
      appBar: appBar(
        title: title ?? MyStrings.articleListScreenAppBar,
        context: context,
      ),
      body: Obx(
        // Rebuilds when article list updates.
        () => listaAticleController.articleListWithTagId.isEmpty
            ? loading()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listaAticleController.articleListWithTagId.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(34, index == 0 ? 10 : 0, 34, 34),
                    child: GestureDetector(
                      onTap: () {
                        singlePageArticleController.getArticleInfo(
                            articleId: listaAticleController
                                .articleListWithTagId[index].id
                                .toString());
                        Get.to(() => ArticleSinglePage());
                      },
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
                                imageUrl: listaAticleController
                                    .articleListWithTagId[index].image!,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Article title.
                                  Text(
                                    listaAticleController
                                        .articleListWithTagId[index].title!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyleLib()
                                        .articleListScreenItemsTitle,
                                  ),
                                  // View count and author.
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.remove_red_eye_rounded,
                                            size: 20,
                                            color: SolidColors
                                                .articleListItemsViewText,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            listaAticleController
                                                .articleListWithTagId[index]
                                                .view!,
                                            style: TextStyleLib()
                                                .articleListScreenItemsView,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          listaAticleController
                                              .articleListWithTagId[index]
                                              .author!,
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
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class ArticleListScreenWithCatId extends StatelessWidget {
  ArticleListScreenWithCatId({super.key, this.title});
  final String? title;
  final ListArticleController listaAticleController =
      Get.put(ListArticleController());
  final SinglePageArticleController singlePageArticleController =
      Get.put(SinglePageArticleController());
  @override
  Widget build(BuildContext context) {
    double articleListItemHeight = 110; // Fixed item height

    return Scaffold(
      backgroundColor: Colors.white,
      // Custom app bar with title.
      appBar: appBar(
        title: title ?? MyStrings.articleListScreenAppBar,
        context: context,
      ),
      body: Obx(
        // Rebuilds when article list updates.
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listaAticleController.articleListWithCatId.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(34, index == 0 ? 10 : 0, 34, 34),
              child: GestureDetector(
                onTap: () {
                  singlePageArticleController.getArticleInfo(
                      articleId: listaAticleController
                          .articleListWithCatId[index].id
                          .toString());
                  Get.to(() => ArticleSinglePage());
                },
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
                          imageUrl: listaAticleController
                              .articleListWithCatId[index].image!,
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Article title.
                            Text(
                              listaAticleController
                                  .articleListWithCatId[index].title!,
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
                                      color:
                                          SolidColors.articleListItemsViewText,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      listaAticleController
                                          .articleListWithCatId[index].view!,
                                      style: TextStyleLib()
                                          .articleListScreenItemsView,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    listaAticleController
                                        .articleListWithCatId[index].author!,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
