import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_of_vehicle/controllers/bottom_navigation/bottom_navigation_controller.dart';

import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_column_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavigationController>(context);

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
                isSelected: controller.currentIndex == 0,
                onPressed: () => controller.setIndex(context, 0),
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/person_icon.svg',
                nameButton: 'PERFIL',
                isSelected: controller.currentIndex == 1,
                onPressed: () => controller.setIndex(context, 1),
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/home_icon.svg',
                nameButton: 'INÍCIO',
                isSelected: controller.currentIndex == 2,
                onPressed: () => controller.setIndex(context, 2),
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/history_icon.svg',
                nameButton: 'HISTÓRICO',
                isSelected: controller.currentIndex == 3,
                onPressed: () => controller.setIndex(context, 3),
              ),
              ButtonColumnWidget(
                icon: 'assets/icons/exit_icon.svg',
                nameButton: 'SAIR',
                isSelected: controller.currentIndex == 4,
                onPressed: () => controller.setIndex(context, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
