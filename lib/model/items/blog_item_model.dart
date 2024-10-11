// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/items/item_components_model.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/my_string.dart';

class BlogItem extends StatelessWidget {
  BlogItem({
    super.key,
    this.titleSize,
    required this.blogmodel,
    required this.posterSize,
    this.textDirection,
  });
  final BlogModel blogmodel;
  final Size posterSize;
  final Size? titleSize;
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemPoster(
          size: SizeController(context).size,
          itemPosterSize: posterSize,
          auther: blogmodel.author ?? "",
          usage: blogmodel.viewNumber,
          posterImage: blogmodel.poster?.image ??
              Assets.images.singlePlaceHolder.provider(),
          showAuthor: true,
          showViews: true,
        ),
        const SizedBox(
          height: 8,
        ),
        ItemTitle(
          itemTitle: Text(
            blogmodel.title ?? MyStrings.blogItemDefaultTitle,
            style: const TextStyle(
              fontFamily: "Dana",
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          width: titleSize?.width ?? posterSize.width,
          textDirection: textDirection ?? TextDirection.ltr,
        ),
      ],
    );
  }
}
