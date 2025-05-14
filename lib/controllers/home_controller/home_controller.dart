import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';
import 'package:intl/intl.dart';

class HomeController {
  final formKey = GlobalKey<FormState>();
  final vehicleWithdrawalController = TextEditingController();
  final returnVehicleController = TextEditingController();
  final dateOfWithdrawalController = TextEditingController();
  final returnDateController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  int calculateDays() {
    final formatter = DateFormat('dd/MM/yyyy');
    final withdrawalDate = formatter.parse(dateOfWithdrawalController.text);
    final returnDate = formatter.parse(returnDateController.text);
    final diff = returnDate.difference(withdrawalDate).inDays;
    return diff < 1 ? 1 : diff;
  }

  Future<void> navigateToVehicleSelection(BuildContext context) async {
    final days = calculateDays();
    Navigator.pushNamed(context, AppRoutes.vehicleSelection, arguments: {
      'days': days,
      'pickupLocation': vehicleWithdrawalController.text,
      'returnLocation': returnVehicleController.text,
      'pickupDateTime': dateOfWithdrawalController.text,
      'returnDateTime': returnDateController.text
    });
  }
}
