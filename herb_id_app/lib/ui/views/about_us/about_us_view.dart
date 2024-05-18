import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../custom_widget/page_title.dart';
import '../../../resources/png_images.dart';
import 'about_us_viewmodel.dart';

class AboutUsView extends StackedView<AboutUsViewModel> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutUsViewModel viewModel,
    Widget? child,
  ) {
    return Center(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const PageTitle(
                        title: "About App",
                        color: Color(0xFF0000FF),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Image.asset(
                        PngImages.aboutApp,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const PageTitle(
                        title: "Developers",
                        color: Color(0xFF0000FF),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: viewModel.developerImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Image.asset(
                            viewModel.developerImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AboutUsViewModel viewModelBuilder(BuildContext context) => AboutUsViewModel();
}
