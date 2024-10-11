import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/items/item_components_model.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/my_string.dart';

class PodcastItem extends StatelessWidget {
  const PodcastItem({
    super.key,
    this.titleSize,
    required this.size,
    required this.posterSize,
    required this.podCastModel,
  });
  final Size size;
  final Size posterSize;
  final Size? titleSize;
  final PodCastModel podCastModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemPoster(
          size: size,
          itemPosterSize: posterSize,
          auther: podCastModel.hosts.first,
          posterImage: podCastModel.poster?.image ??
              Assets.images.singlePlaceHolder.provider(),
          showAuthor: true,
          ownerTextDirection: TextDirection.ltr,
        ),
        const SizedBox(
          height: 8,
        ),
        ItemTitle(
          itemTitle: Text(
            podCastModel.title ?? MyStrings.blogItemDefaultTitle,
            style: const TextStyle(
                fontFamily: "Dana",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14),
          ),
          width: titleSize?.width ?? posterSize.width,
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }
}
