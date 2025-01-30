// ignore_for_file: unused_local_variable

// class BlogModel {
//   int id;
//   Image? image;
//   String? title;
//   String? blogContent;
//   String? author;
//   List<String>? hashTags;
//   bool? favoriteStatus = false;
//   bool? saveStatus = false;
//   int? viewNumber = 0;
//   BlogModel({
//     required this.id,
//     this.image,
//     this.title,
//     this.author,
//     this.blogContent,
//     this.hashTags,
//     this.favoriteStatus,
//     this.saveStatus,
//     this.viewNumber,
//   });
// }

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  ArticleModel({
    required this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });

  ArticleModel.fromJson(Map<String, dynamic> element) {
    String id = element["id"];
    String title = element["title"];
    String image = element["image"];
    String catId = element["cat_id"];
    String catName = element["cat_name"];
    String author = element["author"];
    String view = element["view"];
    String status = element["status"];
    String createdAt = element["created_at"];
  }
}
