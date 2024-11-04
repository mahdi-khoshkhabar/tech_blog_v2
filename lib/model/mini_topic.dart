import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/my_colors.dart';

class MiniTopic extends StatelessWidget {
  const MiniTopic({
    super.key,
    required this.text,
    this.icon,
    this.image,
    this.inputMainAxisAlignment,
    // required this.miniTopicTextStyle
  });
  final Text text;
  // final TextStyle miniTopicTextStyle;
  final Icon? icon;
  final Image? image;
  final MainAxisAlignment? inputMainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: inputMainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        // icon == null
        //     ? const SizedBox.shrink()
        //     : Icon(
        //         icon!.icon,
        //         color: icon!.color ?? Colors.black,
        //         size: icon!.size ?? 24,
        //       ),
        Image(
          image: image?.image ?? Assets.icons.bluePenIcon.provider(),
          height: image?.height ?? 18,
          color: image?.color ?? SolidColors.miniTopicColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text.data ?? "",
            style: TextStyle(
                fontFamily: "Dana",
                fontWeight: FontWeight.bold,
                color: text.style?.color ?? SolidColors.miniTopicColor,
                fontSize: text.style?.fontSize ?? 18)),
        // To align the text to be in the centre
        const SizedBox(
          width: 14,
        ),
      ],
    );
  }
}
