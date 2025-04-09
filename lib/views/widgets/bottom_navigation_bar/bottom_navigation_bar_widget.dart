import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/bottom_navigation/bottom_navigation_controller.dart';

import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_column_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final BottomNavigationController controller;

  BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
  }) : controller = BottomNavigationController(GlobalKey<NavigatorState>());

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
              ButtonColumnWidget(
                icon: 'assets/icons/key_icon.svg',
                nameButton: 'RESERVAS',
                isSelected: currentIndex == 0,
                onPressed: () {},
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/person_icon.svg',
                nameButton: 'PERFIL',
                isSelected: currentIndex == 1,
                onPressed: () {},
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/home_icon.svg',
                nameButton: 'INÍCIO',
                isSelected: currentIndex == 2,
                onPressed: () {},
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/history_icon.svg',
                nameButton: 'HISTÓRICO',
                isSelected: currentIndex == 3,
                onPressed: () {},
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/exit_icon.svg',
                nameButton: 'SAIR',
                isSelected: currentIndex == 4,
                onPressed: () {
                  controller.navigateTo(context, 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
