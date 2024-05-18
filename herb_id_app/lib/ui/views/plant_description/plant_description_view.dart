import 'package:flutter/material.dart';
import 'package:HerdID/custom_widget/app_result.dart';
import 'package:stacked/stacked.dart';

import 'plant_description_viewmodel.dart';

class PlantDescriptionView extends StackedView<PlantDescriptionViewModel> {
  const PlantDescriptionView(this.plantName, {Key? key}) : super(key: key);

  final String plantName;
  @override
  Widget builder(
    BuildContext context,
    PlantDescriptionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: viewModel.busy('description')
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: AppResult(
                familyName: viewModel.familyName,
                localName: viewModel.localName,
                scientificName: viewModel.scientificName,
                commonName: viewModel.commonName,
                description: viewModel.description,
                benefits: viewModel.benefit,
                back: viewModel.backPressed,
                illnessCure: viewModel.illnessCure,
                procedure: viewModel.procedure,
                image: viewModel.image,
                credits: viewModel.credits,
              )));
  }

  @override
  PlantDescriptionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlantDescriptionViewModel();

  @override
  void onViewModelReady(PlantDescriptionViewModel viewModel) {
    viewModel.init(plantName);
    super.onViewModelReady(viewModel);
  }
}
