import 'package:flutter/material.dart';
import 'package:HerdID/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/plants.dart';
import '../../../services/plants_service.dart';

class AdminPageViewModel extends BaseViewModel {
  TextEditingController searchTextController = TextEditingController();
  final _plantsList = locator<PlantsService>();
  final _navigationService = locator<NavigationService>();
  String? prevQuery;
  bool emptyList = false;
  List<Plants> plants = [];

  init() async {
    setBusyForObject("plants", true);
    loadPlants(searchTextController.text);

    searchTextController.addListener(() {
      if (searchTextController.text.isNotEmpty) {
        loadPlants(searchTextController.text);
      } else {
        loadPlants("");
      }
    });
  }

  void loadPlants(String query) async {
    if (query == prevQuery) {
      return;
    }

    setBusy(true);
    prevQuery = query;

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
    _navigationService.navigateToEditDescriptionView(plantData: firstPlantName);
  }

  void logOut() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
}
