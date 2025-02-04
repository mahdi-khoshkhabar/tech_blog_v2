// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:tech_blog_v2/controller/size_controller.dart';
// import 'package:tech_blog_v2/model/article_model.dart';
// import 'package:tech_blog_v2/model/poster_model.dart';
// import 'package:tech_blog_v2/utils/my_colors.dart';

// class HomeScreenPoster extends StatelessWidget {
//   const HomeScreenPoster({
//     super.key,
//     required this.size,
//     this.articleModelList,
//     this.textDirection,
//   });

//   final Size size;
//   final RxList<ArticleModel>? articleModelList;
//   final TextDirection? textDirection;

//   @override
//   Widget build(BuildContext context) {
//     double borderRadiusController = 20;
//     return 
//   }
// }

// class MainScreenPosterImage extends StatelessWidget {
//   const MainScreenPosterImage({
//     super.key,
//     required this.size,
//     required this.borderRadiusController,
//     this.imageProvider,
//   });

//   final Size size;
//   final double borderRadiusController;
//   final ImageProvider? imageProvider;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: size.width,
//       height: size.height / 4.5,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(borderRadiusController),
//         image: DecorationImage(
//             image: imageProvider ?? Assets.images.posterTest.provider(),
//             fit: BoxFit.cover),
//       ),
//       foregroundDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(borderRadiusController),
//           gradient: const LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: GradientColors.homePosterCoverGradiant)),
//     );
//   }
// }
