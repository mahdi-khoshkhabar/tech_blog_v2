import 'package:flutter/material.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/text_style.dart';

class BlackTagBox extends StatelessWidget {
  const BlackTagBox({
    super.key,
    required this.tagModel,
    this.textColor,
  });
  final TagModel tagModel;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: GradientColors.blackTagBox,
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
            Text(
              textAlign: TextAlign.center,
              tagModel.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleLib().tagTitle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteTagBox extends StatelessWidget {
  const WhiteTagBox({
    super.key,
    required this.tagModel,
    this.textColor,
    this.shawIcon,
  });
  final TagModel tagModel;
  final Color? textColor;
  final bool? shawIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: ListColor.witeTagBox.first,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            shawIcon != null
                ? Icon(
                    Icons.tag,
                    color: textColor ?? ListColor.witeTagBox.last,
                    size: 18,
                  )
                : const SizedBox(
                    width: 8,
                  ),
            Text(
              textAlign: TextAlign.center,
              tagModel.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleLib()
                  .tagTitle
                  .copyWith(color: ListColor.witeTagBox.last),
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
    required this.hashTagBoxList,
    this.onFavoriteToggle,
  });

  final BlackTagBox hashTagBox;
  final List<TagModel> hashTagBoxList;
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
        if (widget.hashTagBox.tagModel.favoriteStatues != true) {
          widget.hashTagBox.tagModel.favoriteStatues = true;
          if (!widget.hashTagBoxList.contains(widget.hashTagBox.tagModel)) {
            widget.hashTagBoxList.add(widget.hashTagBox.tagModel);
          }
        } else {
          widget.hashTagBox.tagModel.favoriteStatues = false;
          widget.hashTagBoxList.remove(widget.hashTagBox.tagModel);
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
