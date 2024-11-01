import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class BottomNavigationController {
  final GlobalKey<NavigatorState> navigatorKey;
  int currentIndex = 0;

  BottomNavigationController(this.navigatorKey);

  Future<void> navigateTo(BuildContext context, int index) async {
    currentIndex = index;
    switch (index) {
      case 2:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.history);
        break;
    }
  }
}
