import 'package:get/get.dart';
import 'package:tech_blog_v2/model/article_info_model.dart';
import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/utils/api_constant.dart';

class SinglePageArticleController extends GetxController {
  RxInt articleId = RxInt(0);
  RxBool isLoading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxBool isFavorite = false.obs;
  RxList<TagModel> tagsList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  @override
  onInit() {
    super.onInit();
    getArticleInfo();
  }

  Future<void> getArticleInfo() async {
    isLoading.value = true;

    //TODO user id is a hard code
    var userId = '';
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=info&id=$articleId&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      tagsList.clear();
      response.data['tags'].forEach((element) {
        tagsList.add(TagModel.fromJson(element));
      });
      relatedList.clear();
      response.data['related'].forEach((element) {
        relatedList.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}
