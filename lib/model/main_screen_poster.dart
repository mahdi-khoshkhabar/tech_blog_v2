import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/my_colors.dart';

class MainScreenPoster extends StatelessWidget {
  const MainScreenPoster({
    super.key,
    required this.size,
    required this.blogModel,
    this.imageProvider,
  });

  final Size size;
  final BlogModel blogModel;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    double borderRadiusController = 20;
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeController(context).screenPadding, 10,
          SizeController(context).screenPadding, 0),
      child: SizedBox(
        height: size.height / 4.5,
        child: Stack(children: [
          mainScreenPosterImage(borderRadiusController),
          mainScreenPosterData()
        ]),
      ),
    );
  }

  Container mainScreenPosterImage(borderRadiusController) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusController),
        image: DecorationImage(
            image: imageProvider ?? Assets.images.posterTest.provider(),
            fit: BoxFit.cover),
      ),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusController),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: GradientColors.homePosterCoverGradiant)),
    );
  }

  mainScreenPosterData() {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  blogModel.author ?? "unknown :(",
                  style: const TextStyle(
                      color: SolidColors.posterSubTitle,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Dana",
                      fontSize: 16),
                  maxLines: 1,
                ),
                Text(
                  "View: ${blogModel.viewNumber}",
                  style: const TextStyle(
                      color: SolidColors.posterSubTitle,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Dana",
                      fontSize: 16),
                  maxLines: 1,
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: size.width / 1.5,
              child: Text(
                blogModel.title == null ? "empty :(" : blogModel.title!,
                style: const TextStyle(
                    color: SolidColors.posterTitle,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Dana",
                    fontSize: 20),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
