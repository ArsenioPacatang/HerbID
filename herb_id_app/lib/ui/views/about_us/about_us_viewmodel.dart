import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../model/developer.dart';
import '../../../resources/png_images.dart';
import '../../../services/developer._service.dart';

class AboutUsViewModel extends BaseViewModel {
  final _developerService = locator<DeveloperService>();
  List<Developer> developer = [];
  List<String> developerImages = [
    PngImages.arsenio,
    PngImages.irish,
    PngImages.jairus
  ];

  init() {
    setBusyForObject('developer', true);
    loadDeveloper();
    setBusyForObject('developer', false);
  }

  void loadDeveloper() async {
    setBusy(true);
    await _developerService.developersList().then((value) {
      developer = value;
    });
    setBusy(false);
  }
}
