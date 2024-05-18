import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {Key? key,
      required this.profileImage,
      required this.profileName,
      required this.containerColor})
      : super(key: key);

  final String profileImage;
  final String profileName;
  final int containerColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      color: Color(containerColor),
      child: Column(
        children: [
          // for (var character in profileName.split(''))
          // Expanded(
          //   child: Text(
          //     character,
          //     style: GoogleFonts.sairaStencilOne(
          //       color: const Color(0xFF0F1214),
          //       fontSize: 25,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          SizedBox(
              height: 225,
              child: Image.asset(
                profileName,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              )),
          Expanded(
            child: SizedBox(
                height: 300,
                child: Image.asset(
                  profileImage,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    ));
  }
}
