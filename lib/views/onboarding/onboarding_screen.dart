import 'package:flutter/material.dart';
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
  static final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _onboardingScreens = [
    OnboardingCard(
      image: 'assets/images/image_onboarding_1.jpg',
      title: 'Bem-vindo(a) à Loca Car',
      description:
          'Com a Loca Car você não se preocupa com a burocracia de revisar e checar todo o veículo, cuidamos disso para você viajar sem preocupações',
      buttonText: 'Próximo',
      onPressed: () {
        _pageController.animateToPage(
          1,
          duration: Durations.long2,
          curve: Curves.linear,
        );
      },
    ),
    OnboardingCard(
      image: 'assets/images/onboarding_2.png',
      title: 'Vários modelos de veículos para seu gosto',
      description:
          'Esolha o grupo de carros que mais te agrada e que atenda as suas necessidades.',
      buttonText: 'Entrar',
      onPressed: () {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      },
    ),
  ];
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
                  controller: _pageController,
                  count: _onboardingScreens.length,
                  onDotClicked: (index) {
                    _pageController.animateToPage(
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
                    child: PageView(
                      controller: _pageController,
                      children: _onboardingScreens,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
