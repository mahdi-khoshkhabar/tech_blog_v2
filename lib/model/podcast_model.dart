class PodcastModelREplacement {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;

  PodcastModelREplacement({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });

  PodcastModelREplacement.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = element["poster"];
    publisher = element["publisher"];
    view = element["view"];
    createdAt = element["created_at"];
  }
}
