import 'package:flutter/material.dart';

// class BlogModel {
//   int id;
//   Image? poster;
//   String? title;
//   String? blogContent;
//   String? author;
//   List<String>? hashTags;
//   bool? favoriteStatus = false;
//   bool? saveStatus = false;
//   int? viewNumber = 0;
//   BlogModel({
//     required this.id,
//     this.poster,
//     this.title,
//     this.author,
//     this.blogContent,
//     this.hashTags,
//     this.favoriteStatus,
//     this.saveStatus,
//     this.viewNumber,
//   });
// }

class PodCastModel {
  int id;
  int? listenedNumber;
  Image? poster;
  String? title;
  List<String> hosts;
  List<String>? guests;
  List<String>? hashTags;
  bool? favoriteStatus = false;
  bool? saveStatus = false;
  PodCastModel(
      {required this.id,
      this.listenedNumber,
      this.poster,
      this.title,
      required this.hosts,
      this.guests,
      this.hashTags,
      this.favoriteStatus,
      this.saveStatus});
}

class HashTagModel {
  String? id;
  String? title;
  bool? favoriteStatues = false;
  HashTagModel({required this.id, required this.title, this.favoriteStatues});

  HashTagModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
