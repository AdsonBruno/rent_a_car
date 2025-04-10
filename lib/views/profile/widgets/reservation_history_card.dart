import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/base_card_widget.dart';

class ReservationHistoryCard extends StatelessWidget {
  final String title;
  final String welcome;
  final String statusReservation;
  final String keyStatusReservation;

  const ReservationHistoryCard({
    super.key,
    required this.title,
    required this.welcome,
    required this.keyStatusReservation,
    required this.statusReservation,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      title: title,
      children: [
        Text(
          welcome,
          style: const TextStyle(
            color: AppColors.white,
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 17),
        Row(children: [
          Text(
            keyStatusReservation,
            style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            statusReservation,
            style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ]),
      ],
    );
  }
}
