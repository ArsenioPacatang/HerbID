import 'dart:io';
import 'package:flutter/material.dart';
import 'package:HerdID/app/app.dialogs.dart';
import 'package:HerdID/app/app.router.dart';
import 'package:HerdID/custom_widget/app_tutorial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../../../app/app.locator.dart';


class IdentifyPlantViewModel extends BaseViewModel {
  final BuildContext context;
  late TutorialCoachMark tutorialCoachMark;
  File? image;
  late final GlobalKey<FormState> cameraKey = GlobalKey<FormState>();
  late final GlobalKey<FormState> galleryKey = GlobalKey<FormState>();
  late final GlobalKey<FormState> tipsKey = GlobalKey<FormState>();
  late final GlobalKey<FormState> identifyKey = GlobalKey<FormState>();
  final _dialogService = locator<DialogService>();
  final _snackBarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  IdentifyPlantViewModel(this.context);

  void checkAndRunTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

    if (isFirstLaunch) {
      prefs.setBool('first_launch', false);
      initAppTutorial();
    }
  }

  void initAppTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: addSiteTargetsPage(
        cameraKey: cameraKey,
        galleryKey: galleryKey,
        tipsKey: tipsKey,
        identifyKey: identifyKey,
      ),
      colorShadow: Colors.red,
      paddingFocus: 10,
      hideSkip: false,
      opacityShadow: 0.8,
      onFinish: () {
        _snackBarService.showSnackbar(
          message: "Tutorial Completed",
          duration: const Duration(seconds: 2),
        );
      },
    );
    tutorialCoachMark.show(context: context);
  }

  void uploadImage(ImageSource source) async {
    PermissionStatus cameraStatus = await Permission.camera.request();

    if (cameraStatus.isGranted) {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      rebuildUi();
    } else if (cameraStatus.isDenied) {
      openAppSettings();
    } else if (cameraStatus.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void uploadFileImage(ImageSource source) async {
    PermissionStatus storageStatus = await Permission.storage.request();

    if (Platform.isAndroid && Platform.version.contains('13')) {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      rebuildUi();
    } else {
      if (storageStatus.isGranted) {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;

        final imageTemporary = File(image.path);
        this.image = imageTemporary;
        rebuildUi();
      } else if (storageStatus.isPermanentlyDenied) {
        openAppSettings();
      } else if (storageStatus.isDenied) {
        openAppSettings();
      }
    }
  }

  void identify() async {
    if (image == null) {
      _snackBarService.showSnackbar(
          message: "Image is empty", duration: const Duration(seconds: 3));
      return;
    } else {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        _navigationService.navigateToPredictionResultView(image: image!);
      } else if (result != true) {
        _dialogService.showCustomDialog(variant: DialogType.internetConnection);
      }
    }
  }

  void tips() {
    _dialogService.showCustomDialog(variant: DialogType.identifyTips);
  }
}
