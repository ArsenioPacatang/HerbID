import 'package:HerdID/services/developer_impl_service.dart';
import 'package:HerdID/services/image_service.dart';
import 'package:HerdID/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:HerdID/ui/dialogs/confirmation_save/confirmation_save_dialog.dart';
import 'package:HerdID/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:HerdID/ui/views/home/home_view.dart';
import 'package:HerdID/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:HerdID/ui/views/about_us/about_us_view.dart';
import 'package:HerdID/ui/views/identify_plant/identify_plant_view.dart';
import 'package:HerdID/ui/dialogs/identify_tips/identify_tips_dialog.dart';
import 'package:HerdID/ui/dialogs/internet_connection/internet_connection_dialog.dart';
import 'package:HerdID/services/plants_service.dart';
import 'package:HerdID/services/plants_impl_service.dart';
import 'package:HerdID/ui/views/plant_list/plant_list_view.dart';
import 'package:HerdID/ui/views/sign_in/sign_in_view.dart';
import 'package:HerdID/ui/views/admin_page/admin_page_view.dart';

import '../services/authentication_impl_service.dart';
import '../services/authentication_service.dart';
import '../services/developer._service.dart';
import '../services/image_impl_service.dart';
import '../services/shared_pref_impl_service.dart';
import '../services/shared_pref_service.dart';
import 'package:HerdID/ui/views/edit_description/edit_description_view.dart';
import 'package:HerdID/ui/views/plant_description/plant_description_view.dart';
import 'package:HerdID/ui/views/plant_result/plant_result_view.dart';
import 'package:HerdID/ui/views/prediction_result/prediction_result_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AboutUsView),
    MaterialRoute(page: IdentifyPlantView),
    MaterialRoute(page: PlantListView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: AdminPageView),
    MaterialRoute(page: EditDescriptionView),
    MaterialRoute(page: PlantDescriptionView),
    MaterialRoute(page: PlantResultView),
    MaterialRoute(page: PredictionResultView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PlantsImplService, asType: PlantsService),
    LazySingleton(
        classType: AuthenticationImplService, asType: AuthenticationService),
    LazySingleton(classType: SharedPrefImplService, asType: SharedPrefService),
    LazySingleton(classType: ImageImplService, asType: ImageService),
    LazySingleton(classType: DeveloperImplService, asType: DeveloperService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: IdentifyTipsDialog),
    StackedDialog(classType: InternetConnectionDialog),
    StackedDialog(classType: ConfirmationSaveDialog),
// @stacked-dialog
  ],
)
class App {}
