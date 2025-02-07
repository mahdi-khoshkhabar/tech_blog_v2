import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/podcast_controller.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_string.dart';
import 'package:tech_blog_v2/utils/my_utils.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

/// Displays a list of podcasts.
class PodcastListScreen extends StatelessWidget {
  PodcastListScreen({super.key});

  // Using final for immutability.
  final PodcastController podcastController = Get.put(PodcastController());

  @override
  Widget build(BuildContext context) {
    double podcastListItemHeight = 110; // Fixed item height

    return Scaffold(
      backgroundColor: Colors.white,
      // Custom app bar with title.
      appBar: appBar(
        title: MyStrings.podcastListScreenAppBar,
        context: context,
      ),
      body: Obx(
        // Rebuilds when article list updates.
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: podcastController.podcastList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(34, index == 0 ? 10 : 0, 34, 34),
              child: SizedBox(
                height: podcastListItemHeight,
                width: double.infinity,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    // Podcast image.
                    SizedBox(
                      width: podcastListItemHeight,
                      child: CachedNetworkImage(
                        imageUrl: podcastController.podcastList[index].poster!,
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
                    // Podcast details: title, view count, and author.
                    SizedBox(
                      width: SizeController(context).size.width / 2.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Podcast title.
                          Text(
                            podcastController.podcastList[index].title ??
                                "ERROR: 404",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyleLib().podcastListScreenItemsTitle,
                          ),
                          // View count and author.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: SvgPicture.asset(
                                      Assets.icons.headphone,
                                      width: 14,
                                      colorFilter: const ColorFilter.mode(
                                          SolidColors
                                              .podcastListItemsListenText,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    podcastController.podcastList[index].view!,
                                    style: TextStyleLib()
                                        .podcastListScreenItemsListen,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  podcastController
                                      .podcastList[index].publisher!,
                                  style: TextStyleLib()
                                      .podcastListScreenItemsPublisher,
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
