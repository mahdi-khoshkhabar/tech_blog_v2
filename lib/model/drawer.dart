import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/utils/my_colors.dart';
import 'package:tech_blog_v2/utils/my_string.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: SolidColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeController(context).screenPadding,
            right: SizeController(context).screenPadding),
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.asset(
              Assets.images.logo.path,
              scale: 2.5,
            )),
            selectableRow(myText: MyStrings.userProfile, myVoid: () {}),
            const Divider(),
            selectableRow(myText: MyStrings.aboutTec, myVoid: () {}),
            const Divider(),
            selectableRow(myText: MyStrings.shareTec, myVoid: () {}),
            const Divider(),
            selectableRow(myText: MyStrings.tecIngithub, myVoid: () {}),
          ],
        ),
      ),
    );
  }

  InkWell selectableRow(
      {required String myText, required VoidCallback myVoid}) {
    return InkWell(
      onTap: myVoid,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Text(
          myText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "dana",
            color: SolidColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      )),
    );
  }
}
