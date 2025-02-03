import 'dart:developer';
import 'package:get/get.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/podcast_model.dart';
import 'package:tech_blog_v2/model/poster_model.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/utils/api_constant.dart';

class HomeScreenController extends GetxController {
  late Rx<Poster> poster;
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxList<TagModel> tags = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    // get home items from api
    var response = await DioService().getMethod(ApiConstant.getHomItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisited.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        tags.add(TagModel.fromJson(element));
      });

      log(name: "HomeScreenController", response.data['poster']['title']);
      // print(response.data['poster']['title']);
    }
  }
}
