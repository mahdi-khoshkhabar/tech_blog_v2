import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/view/main%20screen/main_screen.dart';
// import 'package:tech_blog_v2/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.size});
  final Size size;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Future.delayed(const Duration(milliseconds: 2650)).then(
      (value) {

        if (mounted) {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) =>  MainScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.splashScreenBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Assets.images.logo.image(width: widget.size.width / 1.5),
            SpinKitWaveSpinner(
              color: SolidColors.primaryColor,
              waveColor: SolidColors.primaryColor,
              size: widget.size.width / 6,
            ),
          ],
        ),
      ),
    );
  }
}
