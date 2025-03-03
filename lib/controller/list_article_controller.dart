import 'package:get/get.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/components/api_constant.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxList<ArticleModel> articleListWithTagId = RxList();
  RxList<ArticleModel> articleListWithCatId = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    articleList.clear();
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

  getArticleListWithTagId({required String tagId}) async {
    articleListWithTagId.clear();
    isLoading.value = true;

    //TODO get user id from store page ApiConstant.getArticleList+userId
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$tagId&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleListWithTagId.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }

  getArticleListWithCatId({required String catId}) async {
    articleListWithCatId.clear();
    isLoading.value = true;

    //TODO get user id from store page ApiConstant.getArticleList+userId
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=get_articles_with_cat_id&cat_id=$catId&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleListWithCatId.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }
}
