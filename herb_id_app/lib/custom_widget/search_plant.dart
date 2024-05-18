import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/svg_images.dart';

// ignore: must_be_immutable
class SearchPlant extends StatelessWidget {
  final Function() searchPlant;
  final String hintText;
  TextEditingController searchTextController = TextEditingController();

  SearchPlant(
      {Key? key,
      required this.searchPlant,
      required this.searchTextController,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: TextField(
        controller: searchTextController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF78746D),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFBEBAB3),
            ),
            borderRadius: BorderRadius.circular(27),
          ),
          prefixIcon: IconButton(
            onPressed: searchPlant,
            icon: SvgPicture.asset(
              SvgImages.iconSearch,
              height: 24,
              width: 24,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
