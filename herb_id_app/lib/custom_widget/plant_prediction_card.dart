import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantPredictionCard extends StatelessWidget {
  const PlantPredictionCard({
    Key? key,
    required this.plantName,
    required this.image,
    required this.onClick,
    required this.confidencialityRate,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String plantName;
  final String image;
  final String confidencialityRate;
  final double width;
  final double height;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsets.all(8),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
            BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFBEBAB3),
              style: BorderStyle.solid,
            ),
          ),
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(
                    strokeWidth:
                        2.0, // Adjust the thickness of the progress indicator
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(isMobile ? 10 : 16),
              child: Column(
                children: [
                  Text(
                    plantName,
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 16 : 25,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$confidencialityRate%",
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF2D0C57),
                      fontSize: isMobile ? 16 : 25,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
