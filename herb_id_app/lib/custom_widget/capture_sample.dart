import 'package:flutter/material.dart';

class CaptureSample extends StatelessWidget {
  const CaptureSample(
      {Key? key,
      required this.image,
      required this.icon,
      required this.borderColor})
      : super(key: key);

  final String image;
  final Widget icon;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Stack(

      children: [
        Container(
            width: isMobile ? 100 : 200,
            height: isMobile ? 100 : 200,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor, width: 3),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
        Positioned(top: 0, right: 0, child: icon),
      ],
    );
  }
}
