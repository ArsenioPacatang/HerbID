import 'package:HerdID/resources/svg_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HerdID/resources/png_images.dart';

class AppPlantCard extends StatelessWidget {
  const AppPlantCard({
    Key? key,
    required this.plantName,
    required this.image,
    required this.onClick,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String plantName;
  final String image;
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
                placeholder: (context, url) => SpinKitDoubleBounce(itemBuilder: (context, index) => SvgPicture.asset(SvgImages.plant, color: Colors.green,),),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(isMobile ? 10 : 16),
              child: Text(
                plantName,
                style: GoogleFonts.roboto(
                  color: const Color(0xFF2D0C57),
                  fontSize: isMobile ? 16 : 25,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
