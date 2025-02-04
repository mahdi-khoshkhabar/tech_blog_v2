  import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';

Widget loading() {
    return const Center(
      child: SpinKitFadingCube(
                  color: SolidColors.primaryColor,
                  size: 50.0,
                ),
    );
  }