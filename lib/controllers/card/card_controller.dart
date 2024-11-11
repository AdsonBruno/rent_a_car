import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class CardController {
  final GlobalKey<NavigatorState> navigateKey;

  CardController(this.navigateKey);

  Future<void> navigateTo(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.bookingDetail);
  }
}
