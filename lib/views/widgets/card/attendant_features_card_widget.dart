import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_text_styles.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';

import '../../core/app_colors.dart';

class AttendantFeaturesCardWidget extends StatelessWidget {
  const AttendantFeaturesCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomCardWidget(
      width: screenWidth * 0.9,
      height: screenHeight * 0.25,
      backgroundColor: AppColors.white,
      showBorder: true,
      borderWidth: 2,
      borderColor: AppColors.green,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.00,
          top: screenHeight * 0.01,
          bottom: screenHeight * 0.05,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/front_desk_icon.png',
              width: screenWidth * 0.12,
              height: screenHeight * 0.08,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Com Atendente no balcão',
                    style: AppTextStyles.cardTitle,
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  ...buildFeaturesItems(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildFeaturesItems() => const [
        Text(
          'Retire seu veículo com um de nossos atendentes',
          style: AppTextStyles.informationText,
        ),
        Text(
          'Escolha o modelo na hora da retirada',
          style: AppTextStyles.informationText,
        ),
        Text(
          'Agilidade na retirada',
          style: AppTextStyles.informationText,
        ),
        Text(
          '+200 pontos de fidelidade',
          style: AppTextStyles.informationText,
        ),
        Text(
          '50 pontos de milhas',
          style: AppTextStyles.informationText,
        ),
      ];
}
