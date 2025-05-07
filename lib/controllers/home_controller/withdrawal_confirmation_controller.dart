import 'package:flutter/material.dart';

class WithdrawalConfirmationController extends ChangeNotifier {
  String? title;
  String? pickupDateTime;
  String? returnDateTime;
  String? pickupLocation;
  String? returnLocation;
  String? totalPrice;

  void setReservationDetails({
    required String title,
    required String pickupDateTime,
    required String returnDateTime,
    required String pickupLocation,
    required String returnLocation,
    required String totalPrice,
  }) {
    this.title = title;
    this.pickupDateTime = pickupDateTime;
    this.returnDateTime = returnDateTime;
    this.pickupLocation = pickupLocation;
    this.returnLocation = returnLocation;
    this.totalPrice = totalPrice;

    notifyListeners();
  }
}
