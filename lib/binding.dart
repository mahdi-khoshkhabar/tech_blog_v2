import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/list_article_controller.dart';
import 'package:tech_blog_v2/controller/register_controller.dart';
import 'package:tech_blog_v2/controller/single_page_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleController());
    Get.lazyPut(() => SinglePageArticleController());
  }
}
class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
