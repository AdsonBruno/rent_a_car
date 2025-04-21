import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Widget child;
  final VoidCallback? onTap;
  final bool isButton;
  final bool isCircular;
  final double borderRadius;
  final bool showBorder;
  final double borderWidth;
  final Color borderColor;

  const CustomCardWidget({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.onTap,
    this.isButton = false,
    this.isCircular = false,
    this.borderRadius = 30,
    this.showBorder = false,
    this.borderWidth = 1,
    this.borderColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveBorderRadius = isCircular ? 30.0 : borderRadius;

    BoxDecoration createBoxDecoration() {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        color: backgroundColor ?? AppColors.green,
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      );
    }

    return Material(
      elevation: 50,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          effectiveBorderRadius,
        ),
      ),
      child: isButton
          ? InkWell(
              onTap: onTap,
              child: Ink(
                height: height,
                width: width,
                decoration: createBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 21, top: 10),
                  child: child,
                ),
              ),
            )
          : Container(
              height: height,
              width: width,
              decoration: createBoxDecoration(),
              child: child,
            ),
    );
  }
}
