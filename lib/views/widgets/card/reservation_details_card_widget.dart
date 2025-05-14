import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/core/app_text_styles.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';

class ReservationDetailsCardWidget extends StatelessWidget {
  final String cardTitle;
  final String title;
  final String pickupLocation;
  final String returnLocation;
  final String pickupDateTime;
  final String returnDateTime;

  const ReservationDetailsCardWidget({
    super.key,
    required this.cardTitle,
    required this.title,
    required this.pickupLocation,
    required this.returnLocation,
    required this.pickupDateTime,
    required this.returnDateTime,
  });

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
        padding: const EdgeInsets.only(left: 18, top: 5, right: 30, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: AppTextStyles.cardTitle,
            ),
            const SizedBox(height: 12),
            Text(
              'Nome do veículo: $title',
              style: AppTextStyles.informationText,
            ),
            const SizedBox(height: 8),
            Text(
              'Local da retirada: $pickupLocation',
              style: AppTextStyles.informationText,
            ),
            const SizedBox(height: 8),
            Text(
              'Local da devolução: $returnLocation',
              style: AppTextStyles.informationText,
            ),
            const SizedBox(height: 8),
            Text(
              'Data da retirada: $pickupDateTime',
              style: AppTextStyles.informationText,
            ),
            const SizedBox(height: 8),
            Text(
              'Data da devolução: $returnDateTime',
              style: AppTextStyles.informationText,
            ),
          ],
        ),
      ),
    );
  }
}
