import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';
import 'package:rental_of_vehicle/controllers/home_controller/home_validation_controller.dart';

class HomeController {
  final formKey = GlobalKey<FormState>();
  final vehicleWithdrawalController = TextEditingController();
  final returnVehicleController = TextEditingController();
  final dateOfWithdrawalController = TextEditingController();
  final returnDateController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> navigateToVehicleSelection(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.vehicleSelection);
  }
}
