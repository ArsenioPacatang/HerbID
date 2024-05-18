// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i14;

import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:HerdID/ui/views/about_us/about_us_view.dart' as _i4;
import 'package:HerdID/ui/views/admin_page/admin_page_view.dart' as _i8;
import 'package:HerdID/ui/views/edit_description/edit_description_view.dart'
    as _i9;
import 'package:HerdID/ui/views/home/home_view.dart' as _i2;
import 'package:HerdID/ui/views/identify_plant/identify_plant_view.dart' as _i5;
import 'package:HerdID/ui/views/plant_description/plant_description_view.dart'
    as _i10;
import 'package:HerdID/ui/views/plant_list/plant_list_view.dart' as _i6;
import 'package:HerdID/ui/views/plant_result/plant_result_view.dart' as _i11;
import 'package:HerdID/ui/views/prediction_result/prediction_result_view.dart'
    as _i12;
import 'package:HerdID/ui/views/sign_in/sign_in_view.dart' as _i7;
import 'package:HerdID/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const aboutUsView = '/about-us-view';

  static const identifyPlantView = '/identify-plant-view';

  static const plantListView = '/plant-list-view';

  static const signInView = '/sign-in-view';

  static const adminPageView = '/admin-page-view';

  static const editDescriptionView = '/edit-description-view';

  static const plantDescriptionView = '/plant-description-view';

  static const plantResultView = '/plant-result-view';

  static const predictionResultView = '/prediction-result-view';

  static const all = <String>{
    homeView,
    startupView,
    aboutUsView,
    identifyPlantView,
    plantListView,
    signInView,
    adminPageView,
    editDescriptionView,
    plantDescriptionView,
    plantResultView,
    predictionResultView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.aboutUsView,
      page: _i4.AboutUsView,
    ),
    _i1.RouteDef(
      Routes.identifyPlantView,
      page: _i5.IdentifyPlantView,
    ),
    _i1.RouteDef(
      Routes.plantListView,
      page: _i6.PlantListView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i7.SignInView,
    ),
    _i1.RouteDef(
      Routes.adminPageView,
      page: _i8.AdminPageView,
    ),
    _i1.RouteDef(
      Routes.editDescriptionView,
      page: _i9.EditDescriptionView,
    ),
    _i1.RouteDef(
      Routes.plantDescriptionView,
      page: _i10.PlantDescriptionView,
    ),
    _i1.RouteDef(
      Routes.plantResultView,
      page: _i11.PlantResultView,
    ),
    _i1.RouteDef(
      Routes.predictionResultView,
      page: _i12.PredictionResultView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AboutUsView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AboutUsView(),
        settings: data,
      );
    },
    _i5.IdentifyPlantView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.IdentifyPlantView(),
        settings: data,
      );
    },
    _i6.PlantListView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PlantListView(),
        settings: data,
      );
    },
    _i7.SignInView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SignInView(),
        settings: data,
      );
    },
    _i8.AdminPageView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AdminPageView(),
        settings: data,
      );
    },
    _i9.EditDescriptionView: (data) {
      final args = data.getArgs<EditDescriptionViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.EditDescriptionView(args.plantData, key: args.key),
        settings: data,
      );
    },
    _i10.PlantDescriptionView: (data) {
      final args = data.getArgs<PlantDescriptionViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.PlantDescriptionView(args.plantName, key: args.key),
        settings: data,
      );
    },
    _i11.PlantResultView: (data) {
      final args = data.getArgs<PlantResultViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.PlantResultView(args.prediction, args.accuracy, key: args.key),
        settings: data,
      );
    },
    _i12.PredictionResultView: (data) {
      final args = data.getArgs<PredictionResultViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.PredictionResultView(args.image, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class EditDescriptionViewArguments {
  const EditDescriptionViewArguments({
    required this.plantData,
    this.key,
  });

  final String plantData;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"plantData": "$plantData", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditDescriptionViewArguments other) {
    if (identical(this, other)) return true;
    return other.plantData == plantData && other.key == key;
  }

  @override
  int get hashCode {
    return plantData.hashCode ^ key.hashCode;
  }
}

class PlantDescriptionViewArguments {
  const PlantDescriptionViewArguments({
    required this.plantName,
    this.key,
  });

  final String plantName;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"plantName": "$plantName", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PlantDescriptionViewArguments other) {
    if (identical(this, other)) return true;
    return other.plantName == plantName && other.key == key;
  }

  @override
  int get hashCode {
    return plantName.hashCode ^ key.hashCode;
  }
}

class PlantResultViewArguments {
  const PlantResultViewArguments({
    required this.prediction,
    required this.accuracy,
    this.key,
  });

  final String prediction;

  final String accuracy;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"prediction": "$prediction", "accuracy": "$accuracy", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PlantResultViewArguments other) {
    if (identical(this, other)) return true;
    return other.prediction == prediction &&
        other.accuracy == accuracy &&
        other.key == key;
  }

  @override
  int get hashCode {
    return prediction.hashCode ^ accuracy.hashCode ^ key.hashCode;
  }
}

class PredictionResultViewArguments {
  const PredictionResultViewArguments({
    required this.image,
    this.key,
  });

  final _i14.File? image;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"image": "$image", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PredictionResultViewArguments other) {
    if (identical(this, other)) return true;
    return other.image == image && other.key == key;
  }

  @override
  int get hashCode {
    return image.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIdentifyPlantView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.identifyPlantView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlantListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.plantListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditDescriptionView({
    required String plantData,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editDescriptionView,
        arguments: EditDescriptionViewArguments(plantData: plantData, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlantDescriptionView({
    required String plantName,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.plantDescriptionView,
        arguments:
            PlantDescriptionViewArguments(plantName: plantName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlantResultView({
    required String prediction,
    required String accuracy,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.plantResultView,
        arguments: PlantResultViewArguments(
            prediction: prediction, accuracy: accuracy, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPredictionResultView({
    required _i14.File? image,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.predictionResultView,
        arguments: PredictionResultViewArguments(image: image, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIdentifyPlantView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.identifyPlantView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlantListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.plantListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditDescriptionView({
    required String plantData,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editDescriptionView,
        arguments: EditDescriptionViewArguments(plantData: plantData, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlantDescriptionView({
    required String plantName,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.plantDescriptionView,
        arguments:
            PlantDescriptionViewArguments(plantName: plantName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlantResultView({
    required String prediction,
    required String accuracy,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.plantResultView,
        arguments: PlantResultViewArguments(
            prediction: prediction, accuracy: accuracy, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPredictionResultView({
    required _i14.File? image,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.predictionResultView,
        arguments: PredictionResultViewArguments(image: image, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
