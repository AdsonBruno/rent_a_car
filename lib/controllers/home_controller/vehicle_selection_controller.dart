import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class VehicleSelectionController extends ChangeNotifier {
  int? _selectedVehicleIndex;

  int? get selectedVehicleIndex => _selectedVehicleIndex;

  void selectVehicle(int index) {
    if (_selectedVehicleIndex == index) {
      _selectedVehicleIndex = null; // Deselect if already selected
    } else {
      _selectedVehicleIndex = index; // Select the new vehicle
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  Future<void> navigateToWithdrawalConfirmation(
      BuildContext context, Map<String, dynamic> vehicleData) async {
    Navigator.pushNamed(
      context,
      AppRoutes.withdrawalConfirmation,
      arguments: vehicleData,
    );
  }
}
