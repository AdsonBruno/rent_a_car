import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class OnboardingCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final Function onPressed;

  const OnboardingCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
          MaterialButton(
            minWidth: 300,
            onPressed: () => onPressed(),
            color: AppColors.white,
            child: Text(
              buttonText,
              style: const TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Inter'),
            ),
          )
        ],
      ),
    );
  }
}
