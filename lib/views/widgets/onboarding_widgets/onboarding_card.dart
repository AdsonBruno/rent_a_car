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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * 0.60,
                  width: MediaQuery.of(context).size.height * 0.53,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () => onPressed(),
            color: AppColors.white,
            minWidth: 247,
            height: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                color: AppColors.greenTextButton,
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
