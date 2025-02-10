import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_blog_v2/model/article_info_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/utils/api_constant.dart';

class SinglePageArticleController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxInt id = RxInt(0);

  @override
  onInit() {
    super.onInit();
    // getArticleInfo();
  }

  getArticleInfo() async {
    isLoading.value = true;

    //TODO user id is a hard code
    var userId = '';
    log('${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId',
        name: 'SinglePageArticleController get method test');
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      isLoading.value = false;
    }
  }
}
