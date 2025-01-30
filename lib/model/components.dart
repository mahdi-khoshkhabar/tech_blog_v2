// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 1,
      color: const Color.fromARGB(120, 70, 70, 70),
    );
  }
}

launchUrlFunc(String url, context) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
    if (kDebugMode) {
      print("the url ($url) opened");
    }
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text("Could not launch $url"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            ));
    if (kDebugMode) {
      print("Could not launch $url");
    }
  }
}
