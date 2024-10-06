import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/on_boarding_models/app_usage_model.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class OnboardingController {
  final AppUsageModel _appUsageModel = AppUsageModel();
  final PageController pageController = PageController(initialPage: 0);

  Future<void> decideNextScreen(BuildContext context) async {
    bool isFirstUse = await _appUsageModel.isFirstUse();

    if (!context.mounted) {
      return;
    }

    if (isFirstUse) {
      Navigator.pushNamed(context, AppRoutes.onborading);
    } else {
      Navigator.pushNamed(context, AppRoutes.home);
    }
  }
}
