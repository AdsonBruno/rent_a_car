import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> navigateToHome(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.home);
  }

  Future<void> navigateToRegistration(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.customerRegistration);
  }
}
