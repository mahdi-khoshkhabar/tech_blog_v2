import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/model/buttons.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_string.dart';
import 'package:tech_blog_v2/themes.dart';
import 'package:tech_blog_v2/view/register/complete_information_screen.dart';
import 'package:validators/validators.dart';

Future<dynamic> showEmailBottomSheet(BuildContext context) {
  TextEditingController textEditingController = TextEditingController();
  bool isEmailCorrect = false;
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // padding: EdgeInsets.all(0),
        child: Container(
          width: double.maxFinite,
          height: Get.size.height / 2.57,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(MyStrings.insertYourEmail),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(Get.size.width / 8, 0, Get.size.width / 8, 0),
                child: TextField(
                  decoration: Themes()
                      .textFieldInputDecoration
                      .copyWith(hintText: "Email"),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  maxLines: 1,
                  cursorColor: SolidColors.primaryColor,
                  cursorErrorColor: const Color(0xFFB3271E),
                  controller: textEditingController,
                  onChanged: (value) {
                    isEmailCorrect = isEmail(value);
                  },
                ),
              ),
              MyPurpleButton(
                inputString: "next",
                function: () {
                  if (kDebugMode) {
                    print("is this email? $isEmailCorrect");
                  }
                  if (isEmailCorrect == true) {
                    Navigator.pop(context);
                    activateCodeBottomSheet(context);
                  }
                },
              )
            ],
          ),
        ),
      );
    },
  );
}

Future<dynamic> activateCodeBottomSheet(BuildContext context) {
  TextEditingController textEditingController = TextEditingController();
  bool isPasswordLengthEnough = false;
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // padding: EdgeInsets.all(0),
        child: Container(
          width: double.maxFinite,
          height: Get.size.height / 2.57,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(MyStrings.activateCode),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(Get.size.width / 8, 0, Get.size.width / 8, 0),
                child: TextField(
                  decoration: Themes().textFieldInputDecoration.copyWith(
                        hintText: "******",
                      ),
                  textAlign: TextAlign.center,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  maxLines: 1,
                  cursorColor: SolidColors.primaryColor,
                  cursorErrorColor: const Color(0xFFB3271E),
                  controller: textEditingController,
                  onChanged: (value) {
                    if (value.length != 6) {
                      isPasswordLengthEnough = false;
                    } else {
                      isPasswordLengthEnough = true;
                    }
                  },
                ),
              ),
              MyPurpleButton(
                inputString: "next",
                function: () {
                  if (kDebugMode) {
                    print("is Password Length Enough? $isPasswordLengthEnough");
                  }
                  if (isPasswordLengthEnough == true) {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const CompleteInfoScreen(),
                        ));
                  }
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
