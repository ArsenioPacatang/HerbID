import 'dart:io';
import 'package:flutter/material.dart';
import 'package:HerdID/common/app_controller.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';

class HomeViewModel extends BaseViewModel {
  String displayImage = "";
  int currentPageIndex = 1;
  File? image;

  final PageController pageController = PageController(initialPage: 1);
  // final IdentifyPlantViewModel _identifyPlantViewModel = IdentifyPlantViewModel(context);

  void uploadImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    rebuildUi();
  }

  // identify() async {
  //   if (image == null) {
  //     _snackBarService.showSnackbar(
  //         message: "Image is empty", duration: const Duration(seconds: 3));
  //     return;
  //   } else {
  //     AppTempConstant.image = image;
  //     _navigationService.navigateToResultsView();
  //   }
  // }

  void pageChange(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onDestinationSelected(int index) {
    AppController.emailTextController.clear();
    AppController.passwordTextController.clear();
    pageChange(index);
  }

  void onPageChange(int index) {
    currentPageIndex = index;
    if (currentPageIndex == 1) {
      // _identifyPlantViewModel.checkAndRunTutorial();
      rebuildUi(); // Call checkAndRunTutorial from IdentifyPlantViewModel
    } else {
      rebuildUi();
    }
  }
}
