import 'package:flutter/material.dart';

import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/dashed_line_painter.dart';

class BaseCardWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  const BaseCardWidget({
    super.key,
    required this.title,
    required this.children,
    this.backgroundColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 50,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () => {},
        child: Ink(
          height: height ?? 153,
          width: width ?? 388,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.green,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
              Positioned(
                top: 108.5,
                left: 27.5,
                right: 27.5,
                child: CustomPaint(
                  size: const Size(400, 1),
                  painter: DashedLinePainter(),
                ),
              ),
              Positioned(
                top: 120,
                left: 104,
                right: 104,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
