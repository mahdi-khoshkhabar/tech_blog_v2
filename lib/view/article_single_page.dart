import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/list_article_controller.dart';
import 'package:tech_blog_v2/controller/single_page_article_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/gen/fonts.gen.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/model/tag_box.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_string.dart';
import 'package:tech_blog_v2/utils/my_utils.dart';
import 'package:tech_blog_v2/utils/text_style.dart';
import 'package:tech_blog_v2/view/artile_list_screen.dart';

class ArticleSinglePage extends StatefulWidget {
  const ArticleSinglePage({
    super.key,
  });

  @override
  State<ArticleSinglePage> createState() => _ArticleSinglePageState();
}

class _ArticleSinglePageState extends State<ArticleSinglePage> {
  SinglePageArticleController singlePageArticleController =
      Get.put(SinglePageArticleController());
  ListArticleController listArticleController =
      Get.put(ListArticleController());

  @override
  void initState() {
    super.initState();
    singlePageArticleController.getArticleInfo();
  }

  @override
  Widget build(BuildContext context) {
    ItemsBasicIngredients items = ItemsBasicIngredients();

    return AnnotatedRegion<SystemUiOverlayStyle>(
        // for change status bars calor
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness:
              Brightness.light, // برای تنظیم رنگ آیکون‌ها (سفید یا مشکی)
        ),
        child: Stack(children: [
          Scaffold(
            backgroundColor: SolidColors.backgroundColor,
            body: Obx(() {
              if (singlePageArticleController.isLoading.isTrue) {
                return Center(child: loading());
              } else {
                return SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        // Poster
                        Container(
                          width: double.infinity,
                          color: Colors.black.withAlpha(100),
                          child: CachedNetworkImage(
                            imageUrl: singlePageArticleController
                                .articleInfoModel.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.black,
                                  size: SizeController(context).size.width / 2,
                                ),
                              );
                            },
                          ),
                        ),
                        // Data
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.5, 0, 10.5, 0),
                          child: SizedBox(
                            height: 140,
                            child: Column(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  singlePageArticleController
                                      .articleInfoModel.value.title!,
                                  style: TextStyleLib().articleSinglePageTitle,
                                  textDirection: TextDirection.rtl,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                // Author & Creation Time
                                SizedBox(
                                  width:
                                      SizeController(context).size.width / 1.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      // Aothor
                                      Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Assets.images.profileAvatar
                                              .image(width: 30),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            singlePageArticleController
                                                .articleInfoModel.value.author!,
                                            style: const TextStyle(
                                                fontFamily: FontFamily.dana,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),

                                      // Creation time
                                      Text(
                                        singlePageArticleController
                                            .articleInfoModel.value.createdAt!,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            fontFamily: FontFamily.dana,
                                            color: Color.fromARGB(
                                                255, 155, 155, 155),
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Content box
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22.7, 35, 22.7, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: HtmlWidget(
                              '<p dir="rtl">${singlePageArticleController.articleInfoModel.value.content!}',
                              textStyle: const TextStyle(
                                fontFamily: FontFamily.dana,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              enableCaching: true,
                              onLoadingBuilder:
                                  (context, element, loadingProgress) {
                                return loading();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        // Hash tag bar
                        SingleChildScrollView(
                          child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ListView.builder(
                                itemCount:
                                    singlePageArticleController.tagsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: index == 0
                                          ? EdgeInsets.fromLTRB(
                                              SizeController(context)
                                                  .screenPadding,
                                              0,
                                              16,
                                              0)
                                          : const EdgeInsets.fromLTRB(
                                              0, 0, 16, 0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          var tagId =
                                              singlePageArticleController
                                                  .tagsList[index].id!;
                                          await listArticleController
                                              .getArticleListWithTagId(tagId);
                                          Get.off(() => const ArticleListScreenWithTagId());
                                        },
                                        child: WhiteTagBox(
                                          tagModel: singlePageArticleController
                                              .tagsList[index],
                                        ),
                                      ));
                                },
                              )),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // topic for Related posts
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeController(context).screenPadding),
                          child: MiniTopic(
                            shawIcon: true,
                            text: const Text(
                              MyStrings.relatedArticle,
                            ),
                            onPressed: () {
                              log(
                                name: MyStrings.viewHotestBlog,
                                "mini topic worked   ${SizeController(context).size}",
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // Related posts
                        SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            height: SizeController(context).size.height / 4,
                            child: ListView.builder(
                              itemCount: singlePageArticleController
                                  .relatedList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: index == 0
                                      ? EdgeInsets.fromLTRB(
                                          SizeController(context).screenPadding,
                                          0,
                                          16,
                                          0)
                                      : const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                  child: Column(
                                    children: [
                                      // Article poster
                                      items.poster(
                                        imageUrl: singlePageArticleController
                                            .relatedList[index].image!,
                                        auther: singlePageArticleController
                                            .relatedList[index].author,
                                        view: singlePageArticleController
                                            .relatedList[index].view,
                                        size: SizeController(context).size,
                                        ownerTextDirection: TextDirection.rtl,
                                        itemPosterSize:
                                            SizeController.blogItemSize,
                                        showAuthor: true,
                                        showViews: true,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      items.title(
                                          Text(
                                            singlePageArticleController
                                                .relatedList[index].title!,
                                            style: TextStyleLib().blogItemTitle,
                                          ),
                                          singlePageArticleController
                                                  .articleInfoModel
                                                  .value
                                                  .image!
                                                  .length +
                                              50.toDouble(),
                                          null,
                                          TextDirection.rtl)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
          ),
          singlePageAppBar(context: context),
        ]));
  }
}
