import 'package:flutter/material.dart';
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

  Future<void> navigateToNextPage(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.home);
  }
}
