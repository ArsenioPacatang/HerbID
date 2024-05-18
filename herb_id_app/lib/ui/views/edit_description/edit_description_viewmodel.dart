import 'package:flutter/widgets.dart';
import 'package:HerdID/services/plants_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../model/plants.dart';

class EditDescriptionViewModel extends BaseViewModel {
  final bool isMobile;

  EditDescriptionViewModel(BuildContext context)
      : isMobile = MediaQuery.of(context).size.width < 600;

  TextEditingController scientificNameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController benefitsTextController = TextEditingController();
  TextEditingController procedureTextController = TextEditingController();
  TextEditingController illnessTextController = TextEditingController();
  TextEditingController commonNameTextController = TextEditingController();
  TextEditingController familyNameTextController = TextEditingController();
  TextEditingController localNameTextController = TextEditingController();
  TextEditingController creditsTextController = TextEditingController();
  String image = "";
  Plants? plant;
  String predictionName = "";
  final _plantsList = locator<PlantsService>();
  final _snackBarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  bool edit = false;
  int editedIndex = -1;

  init(String plantName) async {
    setBusyForObject("result", true);
    await loadData(plantName);
    Future.delayed(const Duration(seconds: 3));
    rebuildUi();
    setBusyForObject("result", false);
  }

  Future<void> save() async {
    List<String> illnessCureList = illnessTextController.text
        .split(',')
        .map((e) => e.toLowerCase())
        .toList();

    List<String> creditsList = creditsTextController.text
        .split(',')
        .toList();

    var dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.confirmationSave,
    );

    if (dialogResponse?.confirmed == true) {
      var response = await _plantsList.saveHerbalPlantsData(
        predictionName,
        localNameTextController.text,
        scientificNameTextController.text,
        descriptionTextController.text,
        benefitsTextController.text,
        procedureTextController.text,
        commonNameTextController.text,
        familyNameTextController.text,
        illnessCureList,
        creditsList,
      );

      response.fold(
        (l) => _snackBarService.showSnackbar(
          message: l.message,
          duration: const Duration(seconds: 2),
        ),
        (r) {
          rebuildUi();
          _snackBarService.showSnackbar(
            message: "Data has been saved",
            duration: const Duration(seconds: 2),
          );
        },
      );
    }
  }

  void back() {
    _navigationService.back();
  }

  loadData(String plantName) async {
    var response = await _plantsList.getHerbalPlantsData(plantName);

    response.fold(
        (l) => _snackBarService.showSnackbar(
            message: l.message, duration: const Duration(seconds: 2)), (r) {
      predictionName = r.predictionName;
      scientificNameTextController.text = r.scientificName;
      descriptionTextController.text = r.description;
      benefitsTextController.text = r.benefit;
      procedureTextController.text = r.procedure;
      illnessTextController.text = r.cure.join(',');
      commonNameTextController.text = r.commonName;
      familyNameTextController.text = r.familyName;
      localNameTextController.text = r.localName;
      creditsTextController.text = r.credits.join(',');
      image = r.imageResult;
    });
  }

  void editData(int index) {
    if (editedIndex == index) {
      // If the button is clicked again, toggle the edit state and reset editedIndex
      edit = !edit;
      editedIndex = -1;
    } else {
      // If a different button is clicked, update the editedIndex and enable edit mode
      editedIndex = index;
      edit = true;
    }
    rebuildUi();
  }

  void tips() {
    _dialogService.showCustomDialog(variant: DialogType.confirmationSave);
  }
}
