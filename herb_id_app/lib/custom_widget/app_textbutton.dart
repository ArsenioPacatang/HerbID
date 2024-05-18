import 'package:flutter/material.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({Key? key, required this.title, this.textButtonClick})
      : super(key: key);

  final String title;
  final Function()? textButtonClick;

  @override
  // ignore: library_private_types_in_public_api
  _AppTextButtonState createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  Color buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Toggle the button color
          buttonColor = Colors.blue;
        });
        widget.textButtonClick?.call();

        // Delay for 0.5 seconds and then change the color back to green
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            buttonColor = Colors.green;
          });
        });
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.maxFinite,
        margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
        color: buttonColor,
        child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
      ),
    );
  }
}
