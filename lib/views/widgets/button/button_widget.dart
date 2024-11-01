import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class ButtonWidget extends StatefulWidget {
  final String icon;
  final String nameButton;
  final Color? color;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    required this.icon,
    required this.nameButton,
    required this.onPressed,
    this.color,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            widget.icon,
            width: 21,
            height: 21.02,
            colorFilter: ColorFilter.mode(
              widget.color ?? AppColors.white,
              BlendMode.srcIn,
            ),
            allowDrawingOutsideViewBox: true,
          ),
          const SizedBox(height: 4),
          Text(
            widget.nameButton,
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: widget.color ?? AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
