import 'package:flutter/cupertino.dart';

class ProfileModel {
  String name;
  String lastName;
  String emailAddress;
  Image? profileImage;
  
  ProfileModel({
    required this.name,
    required this.lastName,
    required this.emailAddress,
    this.profileImage,
  });
}
