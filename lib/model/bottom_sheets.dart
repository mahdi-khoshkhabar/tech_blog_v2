import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/register_controller.dart';
import 'package:tech_blog_v2/model/buttons.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_string.dart';
import 'package:tech_blog_v2/themes.dart';

Future<dynamic> showEmailBottomSheet(BuildContext context) {
  final RegisterController registerController = Get.put(RegisterController());
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
                padding: EdgeInsets.fromLTRB(
                    Get.size.width / 8, 0, Get.size.width / 8, 0),
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
                  controller: registerController.emailController,
                ),
              ),
              MyPurpleButton(
                inputString: "next",
                function: () {
                  registerController.register();
                  log('email buttom presssed');
                  Navigator.pop(context);
                  activateCodeBottomSheet(context);
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
  final RegisterController registerController = Get.put(RegisterController());
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
                padding: EdgeInsets.fromLTRB(
                    Get.size.width / 8, 0, Get.size.width / 8, 0),
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
                  controller: registerController.oneTimePasswordController,
                  onChanged: (value) {
                  },
                ),
              ),
              MyPurpleButton(
                inputString: "next",
                function: () {
                  registerController.verify();
                },
              )
            ],
          ),
        ),
      );
    },
  );
}

//TODO: manage the previous screens