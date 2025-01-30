import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/hash_tag.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/main_screen_poster.dart';
import 'package:tech_blog_v2/model/mini_topic.dart';
import 'package:tech_blog_v2/utils/my_string.dart';

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
              articleModel: ArticleModel(
                id: "0",
                author: "Mahdi Khoshkhabar",
                catId: "02",
                catName: "AI",
                createdAt: "12/10/2024",
                image:
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdeveloper.nvidia.com%2Fblog%2Fopenai-presents-gpt-3-a-175-billion-parameters-language-model%2F&psig=AOvVaw3rYrP2vJClepN9cFNaE4eX&ust=1738351711051000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLDUwfeWnosDFQAAAAAdAAAAABAE",
                title: "What is artificial intelligence (AI)?",
                view: "2645",
              )),
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
