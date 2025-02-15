import 'package:get/get.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/utils/api_constant.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxList<ArticleModel> articleListWithTagId = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    isLoading.value = true;

    //TODO get user id from store page ApiConstant.getArticleList+userId
    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }

  getArticleListWithTagId(String tagId) async {
    isLoading.value = true;

    //TODO get user id from store page ApiConstant.getArticleList+userId
    var response = await DioService().getMethod('${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$tagId&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleListWithTagId.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }
}
