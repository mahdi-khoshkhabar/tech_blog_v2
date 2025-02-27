// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_v2/binding.dart';
import 'package:tech_blog_v2/components/my_string.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/my_http_overrides.dart';
import 'package:tech_blog_v2/view/main%20screen/article_single_page.dart';
import 'package:tech_blog_v2/view/main%20screen/main_screen.dart';
import 'package:tech_blog_v2/view/splash_screen.dart';

void main() async {
  // Allow all https requests
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  // Restrict screen orientation to portrait mode
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log(name: "app size", SizeController(context).size.toString());
    return GetMaterialApp(
      getPages: [
        GetPage(name: MyStrings.routeMainScreen, page: () => MainScreen(), binding: RegisterBinding()),
        GetPage(name: MyStrings.routeArticleSinglePageScreen, page: () => ArticleSinglePage(), binding: ArticleBinding()),
      ],
      theme: lightTheme(),
      // initialBinding: RegisterBinding(),
      home: SplashScreen(size: SizeController(context).size),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
