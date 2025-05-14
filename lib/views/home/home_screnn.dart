import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/home_models/home_validation_model.dart';
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
  bool _isLoading = false;

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
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Card(
                    elevation: 7.0,
                    color: AppColors.white,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            CustomTextFormFieldWidget(
                              controller:
                                  controller.vehicleWithdrawalController,
                              labelText: 'Onde deseja retirar o veículo?',
                              validator: (value) =>
                                  HomeValidationModel.validateDateOfWithdrawal(
                                      value),
                            ),
                            CustomTextFormFieldWidget(
                              controller: controller.returnVehicleController,
                              labelText: 'Onde deseja devolver o veículo?',
                              validator: (value) =>
                                  HomeValidationModel.validateReturnVehicle(
                                      value),
                            ),
                            CustomTextFormFieldWidget(
                              controller: controller.dateOfWithdrawalController,
                              labelText: 'Data de retirada',
                              isDateTimeField: true,
                              onDateTimeSelected: (dateTime) {},
                              validator: (value) =>
                                  HomeValidationModel.validateDateOfWithdrawal(
                                      value),
                            ),
                            CustomTextFormFieldWidget(
                              controller: controller.returnDateController,
                              labelText: 'Data de entrega',
                              isDateTimeField: true,
                              onDateTimeSelected: (dateTime) {},
                              validator: (value) =>
                                  HomeValidationModel.validateReturnDate(value),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ButtonWidget(
                  nameButton: 'Continuar',
                  onPressed: () async {
                    if ((controller.formKey.currentState?.validate() ??
                            false) &&
                        controller.validateForm()) {
                      setState(() => _isLoading = true);
                      await Future.delayed(const Duration(seconds: 2));
                      await controller.navigateToVehicleSelection(context);
                      setState(() => _isLoading = false);
                    }
                  },
                ),
              ],
            ),
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.green,
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 2),
    );
  }
}
