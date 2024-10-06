import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/on_boarding_models/app_usage_model.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';
import 'package:rental_of_vehicle/models/on_boarding_models/content_model.dart';

class OnboardingController {
  final AppUsageModel _appUsageModel = AppUsageModel();
  final PageController pageController = PageController(initialPage: 0);

  final List<OnboardinModel> onboardingData = [
    OnboardinModel(
      image: 'assets/images/image_onboarding_1.jpg',
      title: 'Bem-vindo(a) à Loca Car',
      description:
          'Com a Loca Car você não se preocupa com a burocracia de revisar e checar todo o veículo, cuidamos disso para você viajar sem preocupações',
      buttonText: 'Próximo',
    ),
    OnboardinModel(
      image: 'assets/images/image_onboarding_2.png',
      title: 'Vários modelos de veículos para seu gosto',
      description:
          'Esolha o grupo de carros que mais te agrada e que atenda as suas necessidades.',
      buttonText: 'Entrar',
    )
  ];

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

  void goToNextPage() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void dispose() {
    pageController.dispose();
  }
}
