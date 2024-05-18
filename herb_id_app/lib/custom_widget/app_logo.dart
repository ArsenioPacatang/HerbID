import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 27),
      child: SizedBox(
        width: 343,
        height: 250,
        child: Image.asset('assets/png/logo.png'),
      ),
    );
  }
}
