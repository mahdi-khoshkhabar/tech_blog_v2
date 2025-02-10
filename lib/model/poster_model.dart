import 'package:tech_blog_v2/utils/api_constant.dart';

class Poster {
  String? id;
  String? title;
  String? image;

  Poster({
    this.id,
    this.title,
    this.image,
  });

  Poster.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.hostDlUrl + element["image"];
  }
}
