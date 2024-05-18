import 'package:flutter/material.dart';
import 'package:HerdID/custom_widget/plant_list.dart';
import 'package:stacked/stacked.dart';
import 'admin_page_viewmodel.dart';

class AdminPageView extends StackedView<AdminPageViewModel> {
  const AdminPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AdminPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: viewModel.busy("plants")
            ? const Center(child: CircularProgressIndicator())
            : PlantList(
                title: "Admin Page",
                plants: viewModel.plants,
                selectedPlant: viewModel.selectPlant,
                emptyList: viewModel.emptyList,
                plantSearchTextController: viewModel.searchTextController,
                logOut: viewModel.logOut,
              ));
  }

  @override
  AdminPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminPageViewModel();

  @override
  void onViewModelReady(AdminPageViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
