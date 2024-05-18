import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HerdID/custom_widget/plant_card.dart';
import 'package:HerdID/custom_widget/search_plant.dart';
import 'package:HerdID/model/plants.dart';

import '../resources/png_images.dart';

// ignore: must_be_immutable
class PlantList extends StatelessWidget {
  PlantList({
    Key? key,
    required this.plants,
    required this.selectedPlant,
    required this.emptyList,
    required this.plantSearchTextController,
    required this.title,
    required this.logOut,
  });

  TextEditingController plantSearchTextController = TextEditingController();
  TextEditingController illnessSearchTextController = TextEditingController();
  List<Plants> plants = [];
  final Function(String plantName) selectedPlant;
  final Function() logOut;
  final String title;
  bool emptyList = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final itemWidthFactor = screenWidth < 600 ? 0.45 : 0.48;
    final itemHeightFactor = screenHeight < 800 ? 0.27 : 0.28;
    final itemWidth = screenWidth * itemWidthFactor;
    final itemHeight = screenHeight * itemHeightFactor;

    return SafeArea(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.all(8),
              child: Text(
                title,
                style: GoogleFonts.sourceSerifPro(
                  color: const Color(0xFF2D0C57),
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (title == "Admin Page")
              ElevatedButton(onPressed: logOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white24
                  ),
                  child: Text('Log Out', style: GoogleFonts.abel(
              color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),))
          ],
        ),

        SearchPlant(
          searchPlant: () {},
          searchTextController: plantSearchTextController,
          hintText: 'Search Plant Name and Illness',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: emptyList == false
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: (plants.length / 2).ceil(),
                    itemBuilder: (context, rowIndex) {
                      int firstIndex = rowIndex * 2;
                      int secondIndex = firstIndex + 1;

                      if (firstIndex < plants.length) {
                        String firstPlantName = plants[firstIndex].commonName;
                        String firstPredictionName =
                            plants[firstIndex].predictionName;
                        String firstPlantImage = plants[firstIndex].image;

                        Widget firstItem = AppPlantCard(
                          onClick: () {
                            selectedPlant(firstPredictionName);
                          },
                          image: firstPlantImage,
                          plantName: firstPlantName,
                          width: itemWidth,
                          height: itemHeight,
                        );

                        if (secondIndex < plants.length) {
                          String secondPlantName =
                              plants[secondIndex].commonName;
                          String secondPredictionName =
                              plants[secondIndex].predictionName;
                          String secondPlantImage = plants[secondIndex].image;

                          Widget secondItem = AppPlantCard(
                            onClick: () {
                              selectedPlant(secondPredictionName);
                            },
                            image: secondPlantImage,
                            plantName: secondPlantName,
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
                  )
                : Center(
                    child: Column(
                      children: [
                        Image.asset(
                          PngImages.emptySearch,
                          width: 375,
                          height: 383,
                        ),
                        Text(
                          'Plant not found',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        Text(
                          'Try searching the plant with \na different keyword',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      ],
                    ),
                  ),
          ),
        )
      ]),
    );
  }
}
