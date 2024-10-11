import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final IconData inputIcon;
  final GestureTapCallback function;
  const AppBarIcons(
      {super.key, required this.inputIcon, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: InkWell(
          onTap: function,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          radius: 30,
          child: Icon(
            inputIcon,
            size: 30,
            color: Colors.black,
          ),
        ));
  }
}
