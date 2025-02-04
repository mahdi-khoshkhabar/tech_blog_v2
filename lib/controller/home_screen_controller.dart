import 'package:get/get.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/podcast_model.dart';
import 'package:tech_blog_v2/model/poster_model.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/utils/api_constant.dart';

class HomeScreenController extends GetxController {
  Rx<Poster> poster = Poster().obs;
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxList<TagModel> tags = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    isLoading.value = true;
    // get home items from api
    var response = await DioService().getMethod(ApiConstant.getHomItems);
    if (response.statusCode == 200) {
      poster.value = Poster.fromJson(response.data['poster']);

      response.data['top_visited'].forEach((element) {
        topVisited.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        tags.add(TagModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }
}
