import 'package:flutter/material.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

class MiniTopic extends StatelessWidget {
  const MiniTopic({
    super.key,
    required this.text,
    this.icon,
    this.image,
    this.inputMainAxisAlignment,
    this.onPressed,
  });
  final Text text;
  final Icon? icon;
  final Image? image;
  final MainAxisAlignment? inputMainAxisAlignment;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
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
          Text(text.data ?? "", style: text.style ?? TextStyleLib().miniTopic),
          // To align the text to be in the centre
          const SizedBox(
            width: 14,
          ),
        ],
      ),
    );
  }
}
