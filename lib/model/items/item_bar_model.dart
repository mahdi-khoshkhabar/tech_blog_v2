// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';

class ItemBar extends StatelessWidget {
  ItemBar({
    super.key,
    this.itemSize,
    this.itemCount,
    required this.itemBarObjectList,
  });

  final Size? itemSize;
  final int? itemCount;
  List itemBarObjectList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: itemSize?.height ?? 50,
        child: ListView.builder(
          itemCount: itemCount ?? itemBarObjectList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? EdgeInsets.fromLTRB(
                      SizeController(context).screenPadding, 0, 16, 0)
                  : const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: itemBarObjectList[index],
            );
          },
        ),
      ),
    );
  }
}
