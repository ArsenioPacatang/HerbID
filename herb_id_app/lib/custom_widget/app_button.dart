import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef OnClick = Function();

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.icon,
    required this.onClick,
    required this.color,
  }) : super(key: key);

  final String icon;
  final OnClick onClick;
  final int color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // Remove padding
        shape:
            const CircleBorder(), // Use CircleBorder to create a circular shape
        backgroundColor: Color(color),
      ),
      child: Container(
          width: 80, // Set a fixed width and height to make it circular
          height: 80,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            icon,
            width: 60,
            height: 60,
          )),
    );
  }
}
