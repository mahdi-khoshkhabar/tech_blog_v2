import 'package:tech_blog_v2/utils/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? categoryName;
  String? view;
  String? createdAt;
  String? publisher;
  String? status;
  // bool? isFavorite;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.categoryName,
    required this.view,
    required this.createdAt,
    required this.publisher,
    required this.status,
    // this.isFavorite,
  });

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConstant.hostdlUrl + element["poster"];
    categoryName = element["cat_name"];
    view = element["view"];
    createdAt = element["created_at"];
    publisher = element["publisher"];
    status = element["status"];
  }
}
