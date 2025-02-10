// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/view/splash_screen.dart';

void main() {
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
    return MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('fa'), // Persian
      // ],
      home: SplashScreen(size: SizeController(context).size),
    );
  }
}