import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_v2/components/api_constant.dart';
import 'package:tech_blog_v2/components/storage.const.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/view/main%20screen/main_screen.dart';
import 'package:tech_blog_v2/view/register/sign_up_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController oneTimePasswordController = TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailController.text,
      'command': 'register'
    };
    var response =
        await DioService().postMethod(url: ApiConstant.postRegister, map: map);
    email = emailController.text;
    userId = response.data['user_id'];
    if (kDebugMode) {
      print(response);
    }

    // return response;
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': oneTimePasswordController.text,
      'command': 'verify',
    };
    log(name: 'map', map.toString());
    var response =
        await DioService().postMethod(url: ApiConstant.postVerify, map: map);
    var status = response.data['response'];
    // return response;

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);
        log('token: ${box.read(token)}');
        log('userId: ${box.read(userId)}');
        Get.offAll(() => MainScreen());
        break;

      case 'incorrect_code':
        // Get.snackbar('Error', 'Invalid code');
        errorSnackBar(message: 'Invalid code');
        debugPrint('Invalid code');
        break;

      case 'expired':
        errorSnackBar(message: 'Code expired');
        break;
    }
  }

  SnackbarController errorSnackBar({required String message}) {
    return Get.showSnackbar(GetSnackBar(
      title: 'Error',
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      borderRadius: 20,
      maxWidth: Get.width * 0.8,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ],
    ));
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.offAll(() => const SignUpScreen());
    } else {
      Get.snackbar('Congrats', 'You are already logged in',
          backgroundColor: Colors.green);
    }
  }
}
