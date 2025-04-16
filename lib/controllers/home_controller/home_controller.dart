import 'package:flutter/material.dart';

class HomeController {
  final formKey = GlobalKey<FormState>();
  final vehicleWithdrawalController = TextEditingController();
  final returnVehicleController = TextEditingController();
  final dateOfWithdrawalController = TextEditingController();
  final returnDateController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
