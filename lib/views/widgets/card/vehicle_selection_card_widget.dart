import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';

class VehicleSelectionCardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double dailyPrice;
  final int days;
  final bool isSelected;
  final VoidCallback onTap;

  const VehicleSelectionCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.dailyPrice,
    required this.days,
    required this.isSelected,
    required this.onTap,
  });

  double get totalPrice => dailyPrice * days;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
        isButton: true,
        onTap: onTap,
        width: 360,
        height: 287,
        backgroundColor: AppColors.white,
        showBorder: true,
        borderColor: isSelected ? AppColors.darkLeafGreen : AppColors.darkGray,
        borderWidth: 2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: AppColors.darkLeafGreen,
                    ),
                  ),
                  const SizedBox(height: 118),
                  Text(
                    'R\$ ${dailyPrice.toStringAsFixed(2)}/dia',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'R\$ ${totalPrice.toStringAsFixed(2)}/total',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Esse valor é apenas a diária',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: AppColors.black,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: -15,
              left: 138,
              right: 10,
              child: Image.asset(
                imageUrl,
                width: 257,
                height: 300,
              ),
            ),
          ],
        ));
  }
}
