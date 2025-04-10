import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  //TODO: Implementar depois a rota para home quando a tela estiver pronta
  // Future<void> navigateToHome(BuildContext context) async {
  //   Navigator.pushNamed(context, AppRoutes.profile);
  // }

  Future<void> navigateToProfile(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.profile);
  }

  Future<void> navigateToRegistration(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.customerRegistration);
  }
}
