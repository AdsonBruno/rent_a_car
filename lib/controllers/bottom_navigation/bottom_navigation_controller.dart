import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class BottomNavigationController extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey;
  int _currentIndex = 0;

  BottomNavigationController(this.navigatorKey);

  int get currentIndex => _currentIndex;

  void setIndex(BuildContext context, int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
      _navigateTo(context, index);
    }
  }

  Future<void> _navigateTo(BuildContext context, int index) async {
    _currentIndex = index;
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.bookingDetail);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.history);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.login);
        break;
    }
  }
}
