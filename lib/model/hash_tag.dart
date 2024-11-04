import 'package:flutter/material.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/my_colors.dart';

class HashTagBox extends StatelessWidget {
  const HashTagBox({
    super.key,
    required this.hashTagModel,
    this.textColor,
  });
  final HashTagModel hashTagModel;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: hashTagModel.favoriteStatues == true
                  ? GradientColors.favoriteTags
                  : GradientColors.tags,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.tag,
              color: textColor ?? Colors.white,
              size: 18,
            ),
            // const SizedBox(
            //   width: 8,
            // ),
            Text(
              textAlign: TextAlign.center,
              hashTagModel.hashTagString,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "dana",
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableHashTagBox extends StatefulWidget {
  const SelectableHashTagBox({
    super.key,
    required this.hashTagBox,
    required this.favoriteHashTagBoxList,
    this.onFavoriteToggle,
  });

  final HashTagBox hashTagBox;
  final List<HashTagModel> favoriteHashTagBoxList;
  final VoidCallback? onFavoriteToggle;

  @override
  State<SelectableHashTagBox> createState() => _SelectableHashTagBoxState();
}

class _SelectableHashTagBoxState extends State<SelectableHashTagBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // تغییر وضعیت favorite
        if (widget.hashTagBox.hashTagModel.favoriteStatues != true) {
          widget.hashTagBox.hashTagModel.favoriteStatues = true;
          if (!widget.favoriteHashTagBoxList
              .contains(widget.hashTagBox.hashTagModel)) {
            widget.favoriteHashTagBoxList.add(widget.hashTagBox.hashTagModel);
          }
        } else {
          widget.hashTagBox.hashTagModel.favoriteStatues = false;
          widget.favoriteHashTagBoxList.remove(widget.hashTagBox.hashTagModel);
        }

        // فراخوانی تابع برای به‌روزرسانی صفحه
        if (widget.onFavoriteToggle != null) {
          widget.onFavoriteToggle!();
        }

        setState(() {});
      },
      child: widget.hashTagBox,
    );
  }
}
