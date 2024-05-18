import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/plants_service.dart';

class PlantDescriptionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _plantService = locator<PlantsService>();
  final _snackbarService = locator<SnackbarService>();

  String description = "";
  String benefit = "";
  String procedure = "";
  String illnessCure = "";
  String commonName = "";
  String localName = "";
  String familyName = "";
  String scientificName = "";
  String image = "";
  String credits = "";

  init(String plantName) async {
    setBusyForObject('description', true);
    await loadPlantDescription(plantName);
    Future.delayed(const Duration(seconds: 3));
    rebuildUi();
    setBusyForObject('description', false);
  }

  loadPlantDescription(String plantName) async {
    var response = await _plantService.getHerbalPlantsData(plantName);

    response.fold(
        (l) => _snackbarService.showSnackbar(
            message: l.message, duration: const Duration(seconds: 2)), (r) {
      description = r.description;
      benefit = r.benefit;
      procedure = r.procedure;
      illnessCure = r.cure.join(',');
      credits = r.credits.join(',');  
      image = r.imageResult;
      commonName = r.commonName;
      localName = r.localName;
      familyName = r.familyName;
      scientificName = r.scientificName;
    });
  }

  void backPressed() {
    _navigationService.back();
  }
}
