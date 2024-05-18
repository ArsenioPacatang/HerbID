import 'dart:io';
import 'package:HerdID/app/app.router.dart';
import 'package:HerdID/services/image_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../common/app_bool.dart';
import '../../../common/app_strings.dart';
import '../../../model/plants.dart';
import '../../../services/plants_service.dart';

class PredictionResultViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _plantsService = locator<PlantsService>();
  final _snackBarService = locator<SnackbarService>();
  final _imageService = locator<ImageService>();

  List<Plants> plants = [];
  String image = "";
  String prediction = "";
  String accuracy = "";
  List otherPrediction = [];
  List otherAccuracy = [];

  init(File image) async {
    setBusyForObject('predictionResult', true);
    await identify(image);
    await loadPlantDescription(prediction, otherPrediction);
    Future.delayed(const Duration(seconds: 3));
    AppBool.loading = false;
    rebuildUi();
    setBusyForObject('predictionResult', false);
  }

  Future<void> loadPlantDescription(
      String plantName, List otherPrediction) async {
    setBusy(true);
    await _plantsService.predictionList(otherPrediction).then((value) {
      plants = value;
    });

    print(plants.length);

    var response = await _plantsService.getHerbalPlantsData(plantName);

    response.fold(
        (l) => _snackBarService.showSnackbar(
            message: l.message, duration: const Duration(seconds: 2)), (r) {
      image = r.imageResult;
    });
    setBusy(false);
  }

  Future<void> identify(File image) async {
    setBusy(true);
    var response = await _imageService.uploadPlant(image);

    response.fold(
        (l) => _snackBarService.showSnackbar(
            message: l.message, duration: const Duration(seconds: 2)), (r) {
      AppStrings.commonName = "";
      AppStrings.localName = "";
      AppStrings.familyName = "";
      AppStrings.scientificName = "";
      AppStrings.accuracy = "";
      AppStrings.description = "";
      AppStrings.benefit = "";
      AppStrings.illnessCure = "";
      AppStrings.procedure = "";
      AppStrings.image = "";
      AppStrings.credits = "";
      prediction = r.prediction;
      otherPrediction = r.otherPrediction;
      accuracy = r.accuracy;
      otherAccuracy = r.otherAccuracy;

    });
    setBusy(false);
  }

  void backPressed() {
    _navigationService.back();
  }

  void selectPlant(String firstPlantName) {
    _navigationService.navigateToPlantDescriptionView(
        plantName: firstPlantName);
  }
}
