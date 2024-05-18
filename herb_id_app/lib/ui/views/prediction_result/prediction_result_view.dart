import 'dart:io';

import 'package:HerdID/resources/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:HerdID/custom_widget/app_prediction.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'prediction_result_viewmodel.dart';

class PredictionResultView extends StackedView<PredictionResultViewModel> {
  const PredictionResultView(
      this.image,
      {Key? key})
      : super(key: key);

  final File? image;

  @override
  Widget builder(
    BuildContext context,
    PredictionResultViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: viewModel.busy('predictionResult')
            ? Center(child: SpinKitDoubleBounce(itemBuilder: (context, index) => SvgPicture.asset(SvgImages.plant, color: Colors.green,),))
            : SafeArea(
                child: AppPrediction(
                otherPrediction: viewModel.otherPrediction,
                otherAccuracy: viewModel.otherAccuracy,
                plants: viewModel.plants,
                selectedPlant: viewModel.selectPlant,
                accuracy: viewModel.accuracy,
                commonName: viewModel.prediction,
                back: viewModel.backPressed,
                image: viewModel.image,
              )));
  }

  @override
  PredictionResultViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PredictionResultViewModel();

  @override
  void onViewModelReady(PredictionResultViewModel viewModel) {
    viewModel.init(image!);
    super.onViewModelReady(viewModel);
  }
}
