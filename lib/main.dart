import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental A Car',
      theme: ThemeData(
        primaryColor: AppColors.white,
        secondaryHeaderColor: AppColors.green,
      ),
      debugShowCheckedModeBanner: false,
      color: const Color(0xFF04662b),
      home: const OnboardingScreen(),
    );
  }
}
