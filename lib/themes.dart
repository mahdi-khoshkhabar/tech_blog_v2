import 'package:flutter/material.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';

class Themes {
  InputDecoration textFieldInputDecoration = const InputDecoration(
    alignLabelWithHint: true,
    fillColor: Color(0xFFF5F5F5),
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: Colors.black)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: SolidColors.primaryColor, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );
}
