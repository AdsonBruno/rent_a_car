import 'package:flutter/material.dart';

import '../../models/home_models/home_validation_model.dart';

class HomeValidationController {
  final formKey = GlobalKey<FormState>();
  final vehicleWithDrawal = TextEditingController();
  final returnVehicle = TextEditingController();
  final dateOfWithdrawal = TextEditingController();
  final returnDate = TextEditingController();

  // bool validateForm() {
  //   return formKey.currentState?.validate() ?? false;
  // }

  String? validateVehicleWithdrawal() {
    return HomeValidationModel.validateDateOfWithdrawal(
      vehicleWithDrawal.text,
    );
  }

  String? validateReturnVehicle() {
    return HomeValidationModel.validateReturnVehicle(
      returnDate.text,
    );
  }

  String? validateDateOfWithdrawal() {
    return HomeValidationModel.validateDateOfWithdrawal(
      dateOfWithdrawal.text,
    );
  }

  String? validateReturnDate() {
    return HomeValidationModel.validateReturnDate(
      returnDate.text,
    );
  }
}
