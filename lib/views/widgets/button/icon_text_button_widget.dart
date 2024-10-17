import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconTextButtonWidget extends StatelessWidget {
  final String iconPath;
  final String buttonName;
  final VoidCallback onPressed;

  const IconTextButtonWidget({
    super.key,
    required this.iconPath,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 24.17),
            Text(buttonName),
          ],
        ),
      ),
    );
  }
}
