class Pooster {
  String? id;
  String? title;
  String? image;

  Pooster({
    required this.id,
    required this.title,
    required this.image,
  });

  Pooster.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}
