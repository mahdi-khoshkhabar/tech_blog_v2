import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/model/fake_data.dart';
import 'package:tech_blog_v2/model/hash_tag.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/main_screen_poster.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/my_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.hashTagBoxList,
    required this.blogitemList,
    required this.blogItemPosterSize,
    required this.podCastItemList,
    required this.podCastItemPosterSize,
  });

  final List<SelectableHashTagBox> hashTagBoxList;
  final List<BlogItem> blogitemList;
  final Size blogItemPosterSize;
  final List<PodcastItem> podCastItemList;
  final Size podCastItemPosterSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //main screen poster
          MainScreenPoster(
            size: SizeController(context).size,
            blogModel: BlogModel(
              id: FakeData().blogList.first.id,
              author: FakeData().blogList.first.author,
              title: FakeData().blogList.first.title,
              poster: FakeData().blogList.first.poster,
              viewNumber: FakeData().blogList.first.viewNumber,
            ),
          ),
          SizedBox(
            height: SizeController(context).bodySpaceBetween,
          ),
          // hash tag bar
          ItemBar(
            itemBarObjectList: hashTagBoxList,
            voidCallback: () {},
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
          //blog item bar
          ItemBar(
            itemBarObjectList: blogitemList,
            itemSize:
                Size(blogItemPosterSize.width, blogItemPosterSize.height + 50),
            itemCount: 5,
            voidCallback: () {},
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
          //podCast item bar
          ItemBar(
            itemBarObjectList: podCastItemList,
            itemSize: Size(
                podCastItemPosterSize.width, podCastItemPosterSize.height + 50),
            itemCount: 5,
            voidCallback: () {},
          ),
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
