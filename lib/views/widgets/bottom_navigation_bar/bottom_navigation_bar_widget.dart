import 'package:flutter/material.dart';

import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomAppBar(
          color: AppColors.darkLeafGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                icon: 'assets/icons/key_icon.svg',
                color: currentIndex == 0
                    ? AppColors.greenSelected
                    : AppColors.white,
                nameButton: 'RESERVAS',
                onPressed: () {},
              ),
              ButtonWidget(
                icon: 'assets/icons/person_icon.svg',
                nameButton: 'PERFIL',
                color: currentIndex == 1
                    ? AppColors.greenSelected
                    : AppColors.white,
                onPressed: () {},
              ),
              ButtonWidget(
                icon: 'assets/icons/home_icon.svg',
                nameButton: 'INÍCIO',
                color: currentIndex == 2
                    ? AppColors.greenSelected
                    : AppColors.white,
                onPressed: () {},
              ),
              ButtonWidget(
                icon: 'assets/icons/history_icon.svg',
                nameButton: 'HISTÓRICO',
                color: currentIndex == 3
                    ? AppColors.greenSelected
                    : AppColors.white,
                onPressed: () {},
              ),
              ButtonWidget(
                icon: 'assets/icons/exit_icon.svg',
                nameButton: 'SAIR',
                color: currentIndex == 4
                    ? AppColors.greenSelected
                    : AppColors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
