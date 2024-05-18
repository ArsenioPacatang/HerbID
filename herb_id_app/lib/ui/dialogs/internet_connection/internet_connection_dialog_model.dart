import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';

class InternetConnectionDialogModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  void tryAgainClick(BuildContext context) async {
    Navigator.of(context).pop();
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      _dialogService.showCustomDialog(variant: DialogType.internetConnection);
    }
  }
}
