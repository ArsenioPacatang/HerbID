// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/confirmation_save/confirmation_save_dialog.dart';
import '../ui/dialogs/identify_tips/identify_tips_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/internet_connection/internet_connection_dialog.dart';

enum DialogType {
  infoAlert,
  identifyTips,
  internetConnection,
  confirmationSave,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.identifyTips: (context, request, completer) =>
        IdentifyTipsDialog(request: request, completer: completer),
    DialogType.internetConnection: (context, request, completer) =>
        InternetConnectionDialog(request: request, completer: completer),
    DialogType.confirmationSave: (context, request, completer) =>
        ConfirmationSaveDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
