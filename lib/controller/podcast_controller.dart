

import 'package:get/get.dart';
import 'package:tech_blog_v2/model/podcast_model.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/utils/api_constant.dart';

class PodcastController extends GetxController {
  RxList<PodcastModel> podcastList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getPodcastList();
  }

  getPodcastList() async {
    isLoading.value = true;

    //TODO get user id from store page ApiConstant.getPodcastList+userId
    var response = await DioService().getMethod(ApiConstant.getPodcastList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        podcastList.add(PodcastModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }
}
