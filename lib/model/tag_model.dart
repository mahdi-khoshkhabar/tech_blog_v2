class TagModel {
  String? id;
  String? title;
  bool? favoriteStatues = false;
  TagModel({required this.id, required this.title, this.favoriteStatues});

  TagModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
