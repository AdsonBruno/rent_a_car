import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class ConfirmationRegistrationController {
  Future<void> navigateToNextpage(BuildContext context) async {
    final userData = {}; // Replace with actual user data
    Navigator.pushNamed(context, AppRoutes.confirmationRegistration,
        arguments: userData);
  }
}
