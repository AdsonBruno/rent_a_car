import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Widget child;
  final VoidCallback? onTap;
  final bool isButton;

  const CustomCardWidget({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.onTap,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 50,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: isButton
            ? InkWell(
                onTap: onTap,
                child: Ink(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: backgroundColor ?? AppColors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 21, top: 10),
                    child: child,
                  ),
                ),
              )
            : Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: backgroundColor ?? AppColors.green,
                ),
                child: child,
              ));
  }
}
