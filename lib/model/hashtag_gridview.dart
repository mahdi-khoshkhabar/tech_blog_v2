import 'package:flutter/material.dart';

class HashTagGridView extends StatelessWidget {
  const HashTagGridView({
    super.key,
    required this.myList,
  });
  final List myList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: GridView.builder(
        // shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: myList.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,
            // crossAxisSpacing: 4,
            childAspectRatio: 0.22,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: myList[index]);
        },
      ),
    );
  }
}
