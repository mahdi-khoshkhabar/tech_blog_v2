// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/gen/fonts.gen.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/tag_box.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_utils.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

class ArticleSinglePage extends StatelessWidget {
  const ArticleSinglePage({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness:
              Brightness.light, // برای تنظیم رنگ آیکون‌ها (سفید یا مشکی)
        ),
        child: Stack(children: [
          Scaffold(
            backgroundColor: SolidColors.backgroundColor,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    // Poster
                    Container(
                      width: double.infinity,
                      color: Colors.black.withAlpha(100),
                      child: CachedNetworkImage(
                        imageUrl: articleModel.image!,
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
                              "رازهای اساسینز کرید والهالا؛ از هری پاتر و ارباب حلقه‌ها تا دارک سولز",
                              style: TextStyleLib().articleSinglePageTitle,
                              textDirection: TextDirection.rtl,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),

                            // Author & Creation Time
                            SizedBox(
                              width: SizeController(context).size.width / 1.5,
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
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        articleModel.author ?? "ERROR: 404",
                                        style: TextStyle(
                                            fontFamily: FontFamily.dana,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),

                                  // Creation time
                                  Text(
                                    //TODO add a function to calculate thae time passing after the creation
                                    "2 روز پیش",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: FontFamily.dana,
                                        color:
                                            Color.fromARGB(255, 155, 155, 155),
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
                          '''
                          <h1>Heading 1</h1>
                          <h2>Heading 2</h2>
                          <h3>Heading 3</h3>
                          <h4>Heading 4</h4>
                          <h5>Heading 5</h5>
                          <h6>Heading 6</h6>
                          ''',
                          textStyle: TextStyle(
                            fontFamily: FontFamily.dana,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          enableCaching: true,
                          onLoadingBuilder: (context, element, loadingProgress) => loading(),
                        ),
                      ),
                    ),
                    // Hash tag bar
                    SingleChildScrollView(
                      child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ListView.builder(
                            itemCount: 10,
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
                                  child: TagBox(
                                      tagModel:
                                          TagModel(id: "1", title: "title")));
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          singlePageAppBar(context: context),
        ]));
  }
}
