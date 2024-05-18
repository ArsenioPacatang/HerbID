import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/developer.dart';

// ignore: must_be_immutable
class DeveloperProfile extends StatelessWidget {
  DeveloperProfile({super.key, required this.developer});

  List<Developer> developer;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Container(
          alignment: AlignmentDirectional.topStart,
          margin: const EdgeInsets.all(8),
          child: Text(
            'Developer',
            style: GoogleFonts.sourceSerifPro(
              color: const Color(0xFF2D0C57),
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: developer.length,
          itemBuilder: (context, rowIndex) {
            return null;
          },
        )))
      ]),
    );
  }
}
