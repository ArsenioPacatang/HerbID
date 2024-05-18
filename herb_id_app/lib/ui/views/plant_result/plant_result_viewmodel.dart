import 'package:HerdID/app/app.locator.dart';
import 'package:HerdID/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/plants_service.dart';

class PlantResultViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _plantsService = locator<PlantsService>();
  final _snackbarService = locator<SnackbarService>();

  init(String plantName, String accuracy) {
    setBusyForObject('description', true);
    loadPlantDescription(plantName, accuracy);
    setBusyForObject('description', false);
  }

  void loadPlantDescription(String plantName, String accuracy) async {
    setBusy(true);
    var response = await _plantsService.getHerbalPlantsData(plantName);

    response.fold(
        (l) => _snackbarService.showSnackbar(
            message: l.message, duration: const Duration(seconds: 2)), (r) {
      AppStrings.commonName = r.scientificName;
      AppStrings.localName = r.localName;
      AppStrings.familyName = r.familyName;
      AppStrings.scientificName = r.scientificName;
      AppStrings.accuracy = accuracy;
      AppStrings.description = r.description;
      AppStrings.benefit = r.benefit;
      AppStrings.illnessCure = r.cure.join(',');
      AppStrings.procedure = r.procedure;
      AppStrings.image = r.imageResult;
      AppStrings.credits = r.credits.join(',');
    });
    setBusy(false);
  }

  void backPressed() {
    _navigationService.back();
  }
}

class PlantService {}
