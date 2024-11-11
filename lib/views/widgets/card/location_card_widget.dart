import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';

class LocationCardWidget extends StatelessWidget {
  final double? screenHeight;
  final double? screenWidth;
  final List<Widget> titleCard;
  final List<Widget> cardContent;
  const LocationCardWidget({
    super.key,
    required this.titleCard,
    required this.cardContent,
    this.screenHeight,
    this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      height: screenHeight ?? 100,
      width: screenWidth ?? 250,
      isButton: false,
      child: Container(
        padding: const EdgeInsets.only(left: 21, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: titleCard,
            ),
            const SizedBox(height: 10.2),
            ...cardContent,
          ],
        ),
      ),
    );
  }
}
