import 'package:tech_blog_v2/utils/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? categoryName;
  String? view;
  String? createdAt;
  String? author;
  String? status;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.categoryName,
    required this.view,
    required this.createdAt,
    required this.author,
    required this.status,
  });

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConstant.hostdlUrl+ element["poster"];
    categoryName = element["cat_name"];
    view = element["view"];
    createdAt = element["created_at"];
    author = element["author"];
    status = element["status"];
  }
}
