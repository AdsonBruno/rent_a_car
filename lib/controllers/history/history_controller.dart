import 'package:flutter/material.dart';

class HistoryController extends ChangeNotifier {
  List<Map<String, dynamic>> reservations = [];

  void addReservation(Map<String, dynamic> reservation) {
    reservations.add(reservation);
    notifyListeners();
  }

  void clearReservations() {
    reservations.clear();
    notifyListeners();
  }
}
