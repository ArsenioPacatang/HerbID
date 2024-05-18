import 'package:flutter/material.dart';
import 'package:HerdID/resources/png_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HerdID/resources/svg_images.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import '../../../custom_widget/app_button.dart';
import 'identify_plant_viewmodel.dart';

class IdentifyPlantView extends StatelessWidget {
  const IdentifyPlantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IdentifyPlantViewModel>.reactive(
      viewModelBuilder: () => IdentifyPlantViewModel(context),
      builder: (context, viewModel, child) => Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF008000), width: 3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Herb',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSerifPro(
                    color: const Color(0xFF0DA181),
                    fontSize: 70,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'ID',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSerifPro(
                    color: const Color(0xFF008000),
                    fontSize: 70,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFF0DA181), width: 2),
              ),
              child: viewModel.image != null
                  ? Image.file(viewModel.image!, fit: BoxFit.cover)
                  : Image.asset(
                      PngImages.defaultImage,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  key: viewModel.cameraKey,
                  icon: SvgImages.cameraLens,
                  color: 0xFF08B7E6,
                  onClick: () {
                    viewModel.uploadImage(ImageSource.camera);
                  },
                ),
                AppButton(
                  key: viewModel.identifyKey,
                  icon: SvgImages.search,
                  color: 0xFFED3E77,
                  onClick: () {
                    viewModel.identify();
                  },
                ),
                AppButton(
                  key: viewModel.galleryKey,
                  icon: SvgImages.gallery,
                  color: 0xFFF6C32A,
                  onClick: () {
                    viewModel.uploadFileImage(ImageSource.gallery);
                  },
                ),
                AppButton(
                  key: viewModel.tipsKey,
                  icon: SvgImages.question,
                  color: 0xFF096992,
                  onClick: viewModel.tips,
                ),
              ],
            ),
          ),
        ],
      ),
      onViewModelReady: (viewModel) => viewModel.checkAndRunTutorial(),
    );
  }
}
