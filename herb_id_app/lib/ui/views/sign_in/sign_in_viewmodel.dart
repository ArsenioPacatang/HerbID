import 'package:HerdID/app/app.router.dart';
import 'package:HerdID/common/app_controller.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';

class SignInViewModel extends BaseViewModel {
  // TextEditingController emailTextController = TextEditingController();
  // TextEditingController passwordTextController = TextEditingController();

  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();

  bool isPasswordVisible = true;

  init() async {
    AppController.emailTextController.clear();
    AppController.passwordTextController.clear();
  }

  Future<void> signIn() async {
    setBusy(true);
    final response = await _authenticationService.signIn(
        AppController.emailTextController.text,
        AppController.passwordTextController.text);

    setBusy(false);
    response.fold(
        (l) => _snackBarService.showSnackbar(
            message: l.message, duration: const Duration(seconds: 2)), (r) {
      AppController.emailTextController.clear();
      AppController.passwordTextController.clear();
      print("Sign in successful");
      _navigationService.navigateToAdminPageView();
    });
  }

  void validateForm({required bool value}) {
    if (value) {
      signIn();
    }
  }

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
