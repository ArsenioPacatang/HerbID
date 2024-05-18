import 'package:flutter/material.dart';
import 'package:HerdID/custom_widget/plant_list.dart';
import 'package:stacked/stacked.dart';
import 'plant_list_viewmodel.dart';

class PlantListView extends StackedView<PlantListViewModel> {
  const PlantListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PlantListViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.busy("plants")
        ? const Center(child: CircularProgressIndicator())
        : PlantList(
            title: "Herbal Plants",
            plants: viewModel.plants,
            selectedPlant: viewModel.selectPlant,
            emptyList: viewModel.emptyList,
            plantSearchTextController: viewModel.searchTextController, logOut: () {  },
          );
  }

  @override
  PlantListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlantListViewModel();

  @override
  void onViewModelReady(PlantListViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
