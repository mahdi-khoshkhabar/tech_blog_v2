import 'package:tech_blog_v2/components/api_constant.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;
  // List<ArticleModel> relatedList = [];
  // List<TagModel> tagsList = [];

  ArticleInfoModel();
  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    var info = element["info"];
    id = info['id'];
    title = info['title'];
    content = info['content'];
     image = ApiConstant.hostDlUrl + info['image'];
    catId = info['cat_id'];
    catName = info['cat_name'];
    author = info['author'];
    view = info['view'];
    status = info['status'];
    createdAt = info['created_at'];
    isFavorite = element["isFavorite"];
    // relatedList = List<ArticleModel>.from(
    //     element["related"].map((response) => ArticleModel.fromJson(response)));
    // tagsList = List<TagModel>.from(
    //     element["tags"].map((response) => TagModel.fromJson(response)));
  }
}



// {
//     "info": {
//         "id": "16",
//         "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
//         "content": "در مدت یک هفته مانده به رونمایی رسمی از Assassin's Creed Mirage، جزئیات جدیدی از این بازی فاش شده است.\n\nچند روز قبل، یوبی‌سافت نام جدیدترین بازی از مجموعه‌ی Assassin's Creed را تحت عنوان Mirage اعلام کرد. این شرکت فرانسوی در بیانیه‌ی خود گفت که رونمایی کامل بازی در تاریخ ۱۹ شهریور صورت خواهد گرفت.\n\nحالا براساس اطلاعات منتشر شده توسط یکی از لیکرهای مشهور سری Assassin’s Creed، داستان بازی تنها در شهر بغداد جریان خواهد داشت. این شهر در بازی شامل چهار منطقه‌ی مختلف است و هر منطقه دارای یک باس خواهد بود.\n\nپیش از این در گزارشی اعلام شده بود که Mirage به ریشه‌های مجموعه‌ی Assassin’s Creed باز خواهد گشت. در این بازی دوباره شاهد بازگشت پرتاب چاقو، مکان‌های مخصوص مخفی‌کاری روی سقف ساختمان‌ها و امکان مخفی کاری با استفاده از پنهان شدن در میان جمعیت NPCهای بازی خواهیم بود. همچنین به نظر می‌رسد که روی پارکور بازی بیشتر کار شده است.\n\nمطابق گزارش‌ها، سازندگان قصد دارند تا تراکم جمعیت Mirage را مشابه بازی Assassin’s Creed Unity بازسازی کند. در Unity همواره شاهد حضور تعداد زیادی از NPC‌های بازی به‌صورت یکجا در صفحه بودیم.\n\nبرای اولین‌بار، رسانه‌ی بلومبرگ در گزارشی اعلام کرد که یوبی‌سافت قصد دارد Assassin’s Creed جدید را با تمرکز بر مخفی کاری و وفاداری بیشتر به ریشه‌های مجموعه عرضه کند؛ یعنی احتمالا Mirage از حال و هوای سه نسخه‌ی اخیر که بیشتر بر پایه‌ی المان‌های نقش آفرینی بودند، فاصله خواهد گرفت.\n\nبازی Assassin’s Creed Mirage، توسط شعبه‌ی بوردو یوبی‌سافت در دست توسعه قرار دارد. براساس گزارش بلومبرگ این بازی، بهار سال ۲۰۲۳ دردسترس علاقه‌مندان قرار خواهد گرفت. بااین‌حال باید تا ۱۹ شهریور منتظر انتشار اخبار رسمی درمورد این بازی موردانتظار ماند.",
//         "image": "/Techblog/assets/upload/images/article/20220904181457.jpg",
//         "cat_id": "3",
//         "cat_name": "اخبار بازی",
//         "author": "محسن چگینی",
//         "view": "6992",
//         "status": "1",
//         "created_at": "۱۴۰۱/۶/۱۲"
//     },
//     "isFavorite": false,
// }