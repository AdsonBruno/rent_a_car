import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? icon;
  final String nameButton;
  final Color? color;
  final VoidCallback onPressed;
  final bool enable;

  const ButtonWidget({
    super.key,
    required this.nameButton,
    required this.onPressed,
    this.icon,
    this.color,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable ? onPressed : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        decoration: BoxDecoration(
          color: enable ? (color ?? AppColors.green) : AppColors.lightGray,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 299,
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                width: 21,
                height: 21,
                colorFilter: ColorFilter.mode(
                  enable ? AppColors.white : AppColors.black,
                  BlendMode.src,
                ),
              ),
            if (icon != null) const SizedBox(width: 8),
            Text(
              nameButton,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: enable ? AppColors.white : AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
