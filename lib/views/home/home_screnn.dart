import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';

import '../../controllers/home_controller/home_controller.dart';
import '../widgets/text_form_field_widget/custom_text_form_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: 500,
            color: AppColors.green,
          ),
          SingleChildScrollView(
            // reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    'LOCA CAR UFAL',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'inter',
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Card(
                  elevation: 7.0,
                  color: AppColors.white,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CustomTextFormFieldWidget(
                          controller: controller.vehicleWithdrawalController,
                          labelText: 'Onde deseja retirar o veículo?',
                        ),
                        CustomTextFormFieldWidget(
                          controller: controller.returnVehicleController,
                          labelText: 'Onde deseja devolver o veículo?',
                        ),
                        CustomTextFormFieldWidget(
                          controller: controller.dateOfWithdrawalController,
                          labelText: 'Data de retirada',
                        ),
                        CustomTextFormFieldWidget(
                          controller: controller.returnDateController,
                          labelText: 'Data de entrega',
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ButtonWidget(nameButton: 'Continuar', onPressed: () {}),
                BottomNavigationBarWidget(
                  currentIndex: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
