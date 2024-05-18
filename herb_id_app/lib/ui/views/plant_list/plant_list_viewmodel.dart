import 'package:flutter/cupertino.dart';
import 'package:HerdID/app/app.router.dart';
import 'package:HerdID/services/plants_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/plants.dart';

class PlantListViewModel extends BaseViewModel {
  TextEditingController searchTextController = TextEditingController();
  TextEditingController searchTextControllerIllness = TextEditingController();
  final _plantsList = locator<PlantsService>();
  final _navigationService = locator<NavigationService>();
  String? prevQuery;
  String? prevQueryIllness;
  bool emptyList = false;
  List<Plants> plants = [];

  init() async {
    setBusyForObject("plants", true);
    loadPlants(searchTextController.text, searchTextControllerIllness.text);

    searchTextController.addListener(() {
      if (searchTextControllerIllness.text.isNotEmpty) {
        loadPlants(searchTextController.text, searchTextControllerIllness.text);
      } else {
        loadPlants(searchTextController.text, "");
      }
    });

    searchTextControllerIllness.addListener(() {
      if (searchTextController.text.isNotEmpty) {
        loadPlants(searchTextController.text, searchTextControllerIllness.text);
      } else {
        loadPlants("", searchTextControllerIllness.text);
      }
    });
  }

  void loadPlants(String query, String illnessQuery) async {
    setBusy(true);
    if (query == prevQuery) {
      return;
    }

    prevQuery = query;
    prevQueryIllness = illnessQuery;

    if (query.isNotEmpty) {
      // Both searchTextControllers have values, filter or sort based on both
      await _plantsList.plantsList(query).then((value) {
        plants = value;
      });
    } else if (query.isNotEmpty) {
      // Only searchTextController has value, filter or sort based on searchTextController
      await _plantsList.plantsList(query).then((value) {
        plants = value;
      });
    } else {
      // Both searchTextControllers are empty, load all plants
      await _plantsList.plantsList("").then((value) {
        plants = value;
      });
    }

    if (plants.isEmpty) {
      emptyList = true;
    } else {
      emptyList = false;
    }

    setBusy(false);
    setBusyForObject("plants", false);
  }

  searchPlant(String p1) {
    // Your searchPlant implementation here
  }

  void selectPlant(String firstPlantName) {
    _navigationService.navigateToPlantDescriptionView(
        plantName: firstPlantName);
  }
}
