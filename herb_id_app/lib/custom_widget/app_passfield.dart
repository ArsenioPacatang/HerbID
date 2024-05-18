import 'package:flutter/material.dart';

class AppPassField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPasswordVisible;
  final Function() showPassword;
  const AppPassField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.controller,
      required this.isPasswordVisible,
      required this.showPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black,
          ),
          child: TextField(
            controller: controller,
            obscureText: isPasswordVisible == false ? true : false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
                border: InputBorder.none,
                prefixIcon: Icon(icon, color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible == false
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: showPassword,
                )),
          ),
        ));
  }
}
