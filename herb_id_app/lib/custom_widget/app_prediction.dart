import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HerdID/custom_widget/plant_prediction_card.dart';

import '../common/ui_helpers.dart';
import '../model/plants.dart';
import '../resources/png_images.dart';
import '../resources/svg_images.dart';

class AppPrediction extends StatelessWidget {
  AppPrediction({
    Key? key,
    required this.accuracy,
    required this.back,
    required this.otherPrediction,
    required this.image,
    required this.commonName,
    required this.otherAccuracy,
    required this.plants,
    required this.selectedPlant,
  }) : super(key: key);

  final String accuracy;

  List otherPrediction;
  List otherAccuracy;
  List<Plants> plants;
  final String commonName;
  final Function(String plantName) selectedPlant;
  final String image;
  final Function() back;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final itemWidthFactor = screenWidth < 600 ? 0.45 : 0.48;
    final itemHeightFactor = screenHeight < 800 ? 0.27 : 0.28;
    final itemWidth = screenWidth * itemWidthFactor;
    final itemHeight = screenHeight * itemHeightFactor;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Result: ',
                  style: GoogleFonts.openSans(
                    color: Colors.black, // Changed to black
                    fontSize: isMobile ? 25 : 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  commonName,
                  style: GoogleFonts.openSans(
                    color: Colors.black, // Changed to black
                    fontSize: isMobile ? 25 : 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Accuracy:',
                      style: GoogleFonts.openSans(
                        color: Colors.black, // Changed to black
                        fontSize: isMobile ? 25 : 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 11),
                    child: Text(
                      "$accuracy%",
                      style: GoogleFonts.openSans(
                        color: Colors.black, // Changed to black
                        fontSize: isMobile ? 25 : 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  selectedPlant(commonName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set your desired color here
                ),
                child: Text(
                  "View Details",
                  style: GoogleFonts.openSans(
                    color: Colors.black, // Changed to black
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpaceMedium,
              otherPrediction.isNotEmpty
                  ? Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: (plants.length / 2).ceil(),
                    itemBuilder: (context, rowIndex) {
                      int firstIndex = rowIndex * 2;
                      int secondIndex = firstIndex + 1;

                      if (firstIndex < plants.length) {
                        String firstPlantName =
                            plants[firstIndex].commonName;
                        String firstPredictionName =
                            plants[firstIndex].predictionName;
                        String firstPlantImage =
                            plants[firstIndex].image;

                        Widget firstItem = PlantPredictionCard(
                          onClick: () {
                            selectedPlant(firstPredictionName);
                          },
                          image: firstPlantImage,
                          plantName: firstPlantName,
                          width: itemWidth,
                          height: itemHeight,
                          confidencialityRate: otherAccuracy[firstIndex],
                        );

                        if (secondIndex < plants.length) {
                          String secondPlantName =
                              plants[secondIndex].commonName;
                          String secondPredictionName =
                              plants[secondIndex].predictionName;
                          String secondPlantImage =
                              plants[secondIndex].image;

                          Widget secondItem = PlantPredictionCard(
                            onClick: () {
                              selectedPlant(secondPredictionName);
                            },
                            image: secondPlantImage,
                            plantName: secondPlantName,
                            confidencialityRate: otherAccuracy[secondIndex],
                            width: itemWidth,
                            height: itemHeight,
                          );

                          return Row(
                            children: [firstItem, secondItem],
                          );
                        } else {
                          return Row(
                            children: [firstItem],
                          );
                        }
                      }

                      return null;
                    },
                  ),
                ),
              )
                  : SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        PngImages.emptySearch,
                        height: 250,
                        width: 250,
                      ),
                      Text(
                        'No Other Predictions Found!',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
