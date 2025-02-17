import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_v2/components/api_constant.dart';
import 'package:tech_blog_v2/components/storage.const.dart';
import 'package:tech_blog_v2/services/dio_service.dart';
import 'package:tech_blog_v2/view/register/complete_information_screen.dart';

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
    if (kDebugMode) {
      print(response);
    }
    //response: verified, user_id: 565, token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NTY1LCJlbWFpbCI6Im1haGRpa2hvc2hraGFiYXIxMzgyQGdtYWlsLmNvbSJ9.GkRqmBJGJNHWWbejFuizl3soPO4I1JuaD69Ps1u6s6A
    // return response;
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userId, response.data['user_id']);
      log('token: ${box.read(token)}');
      log('userId: ${box.read(userId)}');
      Get.offAll(const CompleteInfoScreen());
    } else {
      Get.snackbar('Error', 'Invalid code');
    }
  }
}
