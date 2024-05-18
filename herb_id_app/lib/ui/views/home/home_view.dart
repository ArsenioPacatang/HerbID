import 'package:flutter/material.dart';
import 'package:HerdID/ui/views/about_us/about_us_view.dart';
import 'package:HerdID/ui/views/sign_in/sign_in_view.dart';
import 'package:stacked/stacked.dart';
import '../../../custom_widget/bottom_nav.dart';
import '../identify_plant/identify_plant_view.dart';
import '../plant_list/plant_list_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView(
              controller: viewModel.pageController,
              physics: const AlwaysScrollableScrollPhysics(),
              onPageChanged: viewModel.onPageChange,
              children: const [
                PlantListView(),
                IdentifyPlantView(),
                SignInView(),
                AboutUsView()
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: AppBottomNavBar(
          currentPageIndex: viewModel.currentPageIndex,
          onDestinationSelected: (index) =>
              viewModel.onDestinationSelected(index)),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
