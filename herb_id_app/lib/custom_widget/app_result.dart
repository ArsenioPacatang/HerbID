import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/svg_images.dart';
import '../common/app_constants.dart';

class AppResult extends StatelessWidget {
  const AppResult(
      {Key? key,
      required this.image,
      required this.commonName,
      this.accuracy,
      required this.description,
      required this.benefits,
      required this.back,
      required this.illnessCure,
      required this.procedure,
      required this.localName,
      required this.familyName,
      required this.scientificName,
      required this.credits})
      : super(key: key);

  final String commonName;
  final String? accuracy;
  final String description;
  final String benefits;
  final String illnessCure;
  final String procedure;
  final String image;
  final String localName;
  final String familyName;
  final String scientificName;
  final String credits;
  final Function() back;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: isMobile ? 300 : 400,
              child:  CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => (
                SpinKitDoubleBounce(
                  itemBuilder: (context, index) => SvgPicture.asset(
                    SvgImages.plant,
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    fit: BoxFit.cover,
                  )
                )),
                    
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: IconButton(
                onPressed: back,
                icon: SvgPicture.asset(SvgImages.back),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: isMobile ? 300 : 450),
          width: double.infinity,
          height: double.infinity,
          decoration: const ShapeDecoration(
            color: Color(0xFFF6F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 32),
                  child: Text(
                    'Common name: ',
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    commonName,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 32),
                  child: Text(
                    'Local name: ',
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 18 : 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    localName,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 32),
                  child: Text(
                    'Family Name: ',
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 18 : 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    familyName,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 32),
                  child: Text(
                    'Scientific Name: ',
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 18 : 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    scientificName,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                if (accuracy != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 32),
                        child: Text(
                          'Accuracy:',
                          style: GoogleFonts.openSans(
                            color: const Color(0xFF9586A8),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 11),
                        child: Text(
                          accuracy!,
                          style: GoogleFonts.openSans(
                            color: const Color(0xFF2D0C57),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    AppConstants.description,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    description,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF9586A8),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    AppConstants.benefits,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    benefits,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF9586A8),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    AppConstants.procedure,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    procedure,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF9586A8),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    AppConstants.illnessCure,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    illnessCure,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF9586A8),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    AppConstants.credits,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    credits,
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF9586A8),
                      fontSize: isMobile ? 20 : 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
