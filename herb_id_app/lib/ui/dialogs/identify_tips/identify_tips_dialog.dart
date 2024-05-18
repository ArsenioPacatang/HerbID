import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:HerdID/resources/svg_images.dart';
import 'package:HerdID/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../custom_widget/capture_sample.dart';
import '../../../resources/jpg_image.dart';
import 'identify_tips_dialog_model.dart';

class IdentifyTipsDialog extends StackedView<IdentifyTipsDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const IdentifyTipsDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IdentifyTipsDialogModel viewModel,
    Widget? child,
  ) {

    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(
                            10), // Adjust the margin as needed
                        width: double.infinity,
                        height: isMobile ? 50 : 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green, width: 3),
                        ),
                        child: Center(
                          child: Text(
                            request.title ?? 'CAPTURE TIPS',
                            style: TextStyle(
                              fontSize: isMobile ? 25 : 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CaptureSample(
                  image: JpgImages.captureSample,
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                  borderColor: Colors.green,
                ),
                CaptureSample(
                  image: JpgImages.guava,
                  icon: SvgPicture.asset(
                    SvgImages.wrong,
                    // ignore: deprecated_member_use
                    color: Colors.red,
                    height: 30,
                    width: 30,
                  ),
                  borderColor: Colors.red,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CaptureSample(
                  image: JpgImages.badCapture,
                  icon: SvgPicture.asset(
                    SvgImages.wrong,
                    // ignore: deprecated_member_use
                    color: Colors.red,
                    height: 30,
                    width: 30,
                  ),
                  borderColor: Colors.red,
                ),
                CaptureSample(
                    image: JpgImages.blurImage,
                    icon: SvgPicture.asset(
                      SvgImages.wrong,
                      // ignore: deprecated_member_use
                      color: Colors.red,
                      height: 30,
                      width: 30,
                    ),
                    borderColor: Colors.red),
              ],
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                height: isMobile ? 50 : 65,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Got it',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 16 : 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  IdentifyTipsDialogModel viewModelBuilder(BuildContext context) =>
      IdentifyTipsDialogModel();
}
