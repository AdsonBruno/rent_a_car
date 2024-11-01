import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/history/history_screen.dart';
import 'package:rental_of_vehicle/views/home/home_screen.dart';
import 'package:rental_of_vehicle/views/onboarding/onboarding_screen.dart';

class AppRoutes {
  static const String onborading = '/onboarding';
  static const String home = '/home';
  static const String history = '/history';

  static Map<String, WidgetBuilder> routes = {
    onborading: (context) => const OnboardingScreen(),
    home: (context) => const HomeScreen(),
    history: (context) => const HistoryScreen()
  };
}
