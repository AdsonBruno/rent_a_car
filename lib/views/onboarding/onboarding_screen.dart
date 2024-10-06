import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/onboarding_controllers/onboarding_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';
import 'package:rental_of_vehicle/views/widgets/onboarding_widgets/onboarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController onboardingController = OnboardingController();
  @override
  void dispose() {
    onboardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.green,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SmoothPageIndicator(
                  controller: onboardingController.pageController,
                  count: onboardingController.onboardingData.length,
                  onDotClicked: (index) {
                    onboardingController.pageController.animateToPage(
                      index,
                      duration: Durations.long2,
                      curve: Curves.linear,
                    );
                  },
                  effect: const SwapEffect(
                    type: SwapType.yRotation,
                    activeDotColor: Color(0xFF07FC49),
                    dotColor: Color(0xFFFFFFFF),
                    strokeWidth: 2.0,
                    spacing: 14,
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: PageView.builder(
                      controller: onboardingController.pageController,
                      itemCount: onboardingController.onboardingData.length,
                      itemBuilder: (context, index) {
                        final data = onboardingController.onboardingData[index];
                        return OnboardingCard(
                            image: data.image,
                            title: data.title,
                            description: data.description,
                            buttonText: data.buttonText,
                            onPressed: () {
                              if (index ==
                                  onboardingController.onboardingData.length -
                                      1) {
                                AppRoutes.home;
                              }
                              onboardingController.pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
