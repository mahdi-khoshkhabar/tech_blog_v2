import 'package:flutter/material.dart';
import 'package:tech_blog_v2/my_colors.dart';

class HashTagBox extends StatelessWidget {
  const HashTagBox({super.key, required this.hashTagBoxText});
  final String hashTagBoxText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.tag,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              textAlign: TextAlign.center,
              hashTagBoxText,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "dana",
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
