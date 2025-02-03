import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/model/profile.dart';

class FakeData {
  List hashTagStringList = [
    "Java",
    "Web Programming",
    "Radio",
    "Flutter",
    "Figma",
    "Python",
    "C++",
  ];
  List<TagModel> hashTagList = [];
  List<ArticleModel> blogList = [];
  List<ProfileModel> profileList = [];
  List<TagModel> favoriteHashTagList = [];
}
