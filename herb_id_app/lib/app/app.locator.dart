// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/authentication_impl_service.dart';
import '../services/authentication_service.dart';
import '../services/developer._service.dart';
import '../services/developer_impl_service.dart';
import '../services/image_impl_service.dart';
import '../services/image_service.dart';
import '../services/plants_impl_service.dart';
import '../services/plants_service.dart';
import '../services/shared_pref_impl_service.dart';
import '../services/shared_pref_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<PlantsService>(() => PlantsImplService());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationImplService());
  locator
      .registerLazySingleton<SharedPrefService>(() => SharedPrefImplService());
  locator.registerLazySingleton<ImageService>(() => ImageImplService());
  locator.registerLazySingleton<DeveloperService>(() => DeveloperImplService());
}
