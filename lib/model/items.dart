// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_components.dart';
import 'package:tech_blog_v2/components/text_style.dart';

class ItemsBasicIngredients {
  poster({
    required String imageUrl,
    required Size size,
    Size? itemPosterSize,
    // Image? posterImage,
    String? auther,
    String? view,
    TextDirection? ownerTextDirection, 
    bool? showAuthor = false,
    bool? showViews = false,
  }) {
    //poster image
    return SizedBox(
      width: itemPosterSize?.width ?? size.width / 2.7,
      height: itemPosterSize?.height ?? size.height / 2.7,
      child: Stack(
        children: [
          SizedBox(
            width: SizeController.podCastItemSize.width,
            height: SizeController.podCastItemSize.height,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
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
                return loading();
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
          //poster data
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showAuthor == true
                    ?
                    //author name
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: itemPosterSize?.width == null
                              ? (size.width / 2.7) / 1.3
                              : itemPosterSize!.width / 1.1,
                          child: Text(
                            auther ?? "",
                            style: TextStyleLib().blogItemAuthor,
                            textDirection:
                                ownerTextDirection ?? TextDirection.ltr,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                showViews == true
                    ?
                    //view
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            view.toString(),
                            style: TextStyleLib().blogItemView,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Image(
                            image: Assets.icons.eye.provider(),
                            height: 18,
                            color: Colors.white,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }

  title(Text titleText, double? width, int? maxLine,
      TextDirection? textDirection) {
    return SizedBox(
      width: width,
      child: Text(
        titleText.data!,
        textDirection: textDirection ?? TextDirection.rtl,
        style: titleText.style ?? TextStyleLib().blogItemTitle,
        maxLines: maxLine ?? 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ItemBar extends StatelessWidget {
  ItemBar({
    super.key,
    this.itemSize,
    this.itemCount,
    required this.itemBarObjectList,
    required this.voidCallback,
  });

  final Size? itemSize;
  final int? itemCount;
  final VoidCallback voidCallback;
  RxList itemBarObjectList = RxList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: itemSize?.height ?? 50,
        child: Obx(() {
          return ListView.builder(
            itemCount: itemCount ?? itemBarObjectList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? EdgeInsets.fromLTRB(
                        SizeController(context).screenPadding, 0, 16, 0)
                    : const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: itemBarObjectList[index],
              );
            },
          );
        }),
      ),
    );
  }
}
