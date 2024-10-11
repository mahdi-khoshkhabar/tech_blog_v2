// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/my_colors.dart';

class ItemPoster extends StatelessWidget {
  ItemPoster({
    super.key,
    required this.size,
    required this.auther,
    this.usage,
    this.itemPosterSize,
    this.posterImage,
    this.showAuthor,
    this.showViews,
    this.ownerTextDirection,
  });
  final Size size;
  final Size? itemPosterSize;
  final ImageProvider? posterImage;
  final String auther;
  final int? usage;
  final TextDirection? ownerTextDirection;
  bool? showAuthor = false;
  bool? showViews = false;
  @override
  Widget build(BuildContext context) {
    double borderRadiusController = 20;
    return SizedBox(
      width: itemPosterSize?.width ?? size.width / 2.7,
      height: itemPosterSize?.height ?? size.height / 2.7,
      child: Stack(
        children: [
          //poster image
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(borderRadiusController),
              image: DecorationImage(
                  image:
                      posterImage ?? Assets.images.singlePlaceHolder.provider(),
                  fit: BoxFit.cover),
            ),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    colors: GradientColors.blogPost,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: const Stack(
              children: [],
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
                            auther,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "dana",
                              fontSize: 14,
                            ),
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
                            usage.toString(),
                            style: const TextStyle(color: Colors.white),
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
}

class ItemTitle extends StatelessWidget {
  const ItemTitle(
      {super.key,
      required this.itemTitle,
      required this.width,
      this.maxLine,
      this.textDirection});
  final Text itemTitle;
  final double width;
  final int? maxLine;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        itemTitle.data!,
        textDirection: textDirection ?? TextDirection.rtl,
        style: TextStyle(
            color: itemTitle.style?.color ?? Colors.black,
            fontFamily: "Dana",
            fontSize: itemTitle.style?.fontSize ?? 14,
            fontWeight: itemTitle.style?.fontWeight ?? FontWeight.bold),
        maxLines: maxLine ?? 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
