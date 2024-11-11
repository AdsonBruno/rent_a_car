import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/card/card_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/dashed_line_painter.dart';

class BaseCardWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double? screenHeight;
  final double? screenWidth;
  final Color? backgroundColor;
  final CardController controller;

  BaseCardWidget(
      {super.key,
      required this.title,
      required this.children,
      this.screenHeight,
      this.screenWidth,
      this.backgroundColor})
      : controller = CardController(GlobalKey<NavigatorState>());

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      height: screenHeight ?? 153,
      width: screenWidth ?? 388,
      isButton: true,
      onTap: () => controller.navigateTo(context),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 21, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
        Positioned(
          left: 27.5,
          top: 108.5,
          right: 27.5,
          child: CustomPaint(
            size: const Size(400, 1),
            painter: DashedLinePainter(),
          ),
        ),
        Positioned(
          left: 104,
          top: 120,
          right: 104,
          child: FittedBox(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
