import 'package:flutter/material.dart';
import 'package:HerdID/common/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../custom_widget/app_result.dart';
import 'plant_result_viewmodel.dart';

class PlantResultView extends StackedView<PlantResultViewModel> {
  const PlantResultView(this.prediction, this.accuracy, {Key? key})
      : super(key: key);

  final String prediction;
  final String accuracy;
  @override
  Widget builder(
    BuildContext context,
    PlantResultViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: viewModel.busy('description')
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: AppResult(
                familyName: AppStrings.familyName,
                scientificName: AppStrings.scientificName,
                localName: AppStrings.localName,
                commonName: AppStrings.commonName,
                accuracy: AppStrings.accuracy,
                description: AppStrings.description,
                benefits: AppStrings.benefit,
                back: viewModel.backPressed,
                illnessCure: AppStrings.illnessCure,
                procedure: AppStrings.procedure,
                image: AppStrings.image,
                credits: AppStrings.credits,
              )));
  }

  @override
  PlantResultViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlantResultViewModel();

  @override
  void onViewModelReady(PlantResultViewModel viewModel) {
    viewModel.init(prediction, accuracy);
    super.onViewModelReady(viewModel);
  }
}
