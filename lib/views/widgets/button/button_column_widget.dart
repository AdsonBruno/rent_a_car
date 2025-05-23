import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class ButtonColumnWidget extends StatelessWidget {
  final String? icon;
  final String nameButton;
  final Color? color;
  final bool isSelected;
  final VoidCallback onPressed;

  const ButtonColumnWidget({
    super.key,
    required this.nameButton,
    required this.onPressed,
    this.icon,
    this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = isSelected ? AppColors.greenSelected : AppColors.white;
    print(isSelected);
    return IconButton(
        onPressed: onPressed,
        icon: Column(
          children: [
            SvgPicture.asset(
              icon!,
              width: 18,
              height: 20,
              colorFilter: ColorFilter.mode(
                activeColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              nameButton,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: activeColor,
              ),
            )
          ],
        ));

    // return InkWell(
    //   onTap: enable ? onPressed : null,
    //   borderRadius: BorderRadius.circular(8),
    //   child: Ink(
    //     // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
    //     decoration: BoxDecoration(
    //         // color: enable ? (color ?? AppColors.green) : AppColors.lightGray,
    //         // borderRadius: BorderRadius.circular(8),
    //         ),
    //     width: 299,
    //     height: 63,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         if (icon != null)
    //           SvgPicture.asset(
    //             icon!,
    //             width: 18,
    //             height: 20,
    //             colorFilter: ColorFilter.mode(
    //               enable ? AppColors.white : AppColors.black,
    //               BlendMode.srcIn,
    //             ),
    //           ),
    //         Text(
    //           nameButton,
    //           style: TextStyle(
    //             fontSize: 10,
    //             fontFamily: 'Inter',
    //             fontWeight: FontWeight.w600,
    //             color: enable ? Colors.white : Colors.black,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
