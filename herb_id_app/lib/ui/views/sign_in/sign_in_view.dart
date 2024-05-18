import 'package:flutter/material.dart';
import 'package:HerdID/common/app_controller.dart';
import 'package:HerdID/custom_widget/elevated_button.dart';
import 'package:HerdID/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import '../../../custom_widget/app_logo.dart';
import 'sign_in_viewmodel.dart';

final _formKey = GlobalKey<FormState>();

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return Center(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogo(),
                verticalSpaceMedium,
                TextFormField(
                  controller: AppController.emailTextController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Email is required" : null,
                  onChanged: (value) => _formKey.currentState!.validate(),
                ),
                verticalSpaceSmall,
                TextFormField(
                  controller: AppController.passwordTextController,
                  style: const TextStyle(color: Colors.black),
                  obscureText: viewModel.isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: const TextStyle(color: Colors.black),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                    suffixIcon: IconButton(
                      onPressed: () => viewModel.showPassword(),
                      icon: Icon(
                        viewModel.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Password is required" : null,
                  onChanged: (value) => _formKey.currentState!.validate(),
                ),
                verticalSpaceSmall,
                //const AppTextButton(title: "SIGN IN")
                CustomElevatedButton(
                    onPressed: () => viewModel.validateForm(
                        value: _formKey.currentState!.validate()),
                    text: "SIGN IN")
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();

  @override
  void onViewModelReady(SignInViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
