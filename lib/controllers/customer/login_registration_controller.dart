import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/user_data_model.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class LoginRegistrationController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailConfirmationController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> navigateToNextPage(
      BuildContext context, UserDataModel userData) async {
    Navigator.pushNamed(context, AppRoutes.confirmationRegistration,
        arguments: userData);
  }
}
