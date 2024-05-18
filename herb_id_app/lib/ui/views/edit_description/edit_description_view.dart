import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:HerdID/custom_widget/elevated_button.dart';
import 'package:HerdID/custom_widget/text_input.dart';
import 'package:HerdID/resources/svg_images.dart';
import 'package:stacked/stacked.dart';

import 'edit_description_viewmodel.dart';

final _formKey = GlobalKey<FormState>();

class EditDescriptionView extends StackedView<EditDescriptionViewModel> {
  const EditDescriptionView(this.plantData, {Key? key}) : super(key: key);
  
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String plantData;
  
  @override
  Widget builder(
    BuildContext context,
    EditDescriptionViewModel viewModel,
    Widget? child,
    
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: viewModel.busy("result")
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
                Stack(
                  children: [
                    SizedBox(
              width: double.infinity,
              height: viewModel.isMobile ? 300 : 400,
              child:  CachedNetworkImage(
                imageUrl: viewModel.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => (
                SpinKitDoubleBounce(
                  itemBuilder: (context, index) => SvgPicture.asset(
                    SvgImages.plant,
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    fit: BoxFit.cover,
                  )
                )),
                    
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: IconButton(
                        onPressed: viewModel.back,
                        icon: SvgPicture.asset(SvgImages.back),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin:
                        EdgeInsets.only(top: viewModel.isMobile ? 300 : 400),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFF6F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            TextFormInput(
                              index:
                                  0, // Set the index for the first TextFormInput
                              hintText: "Local Name",
                              plantTextController:
                                  viewModel.localNameTextController,
                              labelText: 'Local Name',
                              validationText: 'Please input common name',
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel
                                  .editedIndex, // Pass the editedIndex from the view model
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              hintText: "Common Name",
                              plantTextController:
                                  viewModel.commonNameTextController,
                              labelText: 'Common Name',
                              validationText: 'Please input common name',
                              index: 1,
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 2,
                              hintText: "Family Name",
                              plantTextController:
                                  viewModel.familyNameTextController,
                              labelText: 'Family Name',
                              validationText: 'Please input plant family name',
                            ),
                            const SizedBox(height: 10),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 3,
                              hintText: "Scientific Name",
                              plantTextController:
                                  viewModel.scientificNameTextController,
                              labelText: 'Scientific Name',
                              validationText: 'Please input scientific name',
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 4,
                              hintText: "Plant Description",
                              plantTextController:
                                  viewModel.descriptionTextController,
                              labelText: 'Plant Description',
                              validationText: 'Please input plant description',
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 5,
                              hintText: "Plant Benefits",
                              plantTextController:
                                  viewModel.benefitsTextController,
                              labelText: 'Plant Benefits',
                              validationText: 'Please input plant benefits',
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 6,
                              hintText: "Plant Procedure",
                              plantTextController:
                                  viewModel.procedureTextController,
                              labelText: 'Plant Procedure',
                              validationText: 'Please input plant procedure',
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 7,
                              hintText: "Plant Cure",
                              plantTextController:
                                  viewModel.illnessTextController,
                              labelText: 'Plant Cure',
                              validationText: 'Please input plant cure',
                            ),
                            const SizedBox(height: 20),
                            TextFormInput(
                              clickEdit: viewModel.editData,
                              editedIndex: viewModel.editedIndex,
                              index: 8,
                              hintText: "Credits",
                              plantTextController:
                                  viewModel.creditsTextController,
                              labelText: 'Credits By',
                              validationText: 'Please input credits',
                            ),
                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, bottom: 20.0),
                              child: CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    viewModel.save();
                                  }
                                },
                                text: "SAVE",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ]),
            ),
    );
  }

  @override
  EditDescriptionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditDescriptionViewModel(context);

  @override
  void onViewModelReady(EditDescriptionViewModel viewModel) {
    viewModel.init(plantData);
    super.onViewModelReady(viewModel);
  }
}
