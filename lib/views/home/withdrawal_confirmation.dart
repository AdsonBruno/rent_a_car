import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_vehicle/controllers/home_controller/withdrawal_confirmation_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/card/custom_card_widget.dart';

class WithdrawalConfirmation extends StatelessWidget {
  final Map<String, dynamic> vehicleData;

  const WithdrawalConfirmation({
    super.key,
    required this.vehicleData,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final args =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final args = vehicleData;

    return ChangeNotifierProvider(
      create: (_) => WithdrawalConfirmationController()
        ..setReservationDetails(
          title: args['title'],
          pickupDateTime: args['pickupDateTime'],
          returnDateTime: args['returnDateTime'],
          pickupLocation: args['pickupLocation'],
          returnLocation: args['returnLocation'],
          totalPrice: args['totalPrice'],
        ),
      child: Consumer<WithdrawalConfirmationController>(
        builder: (context, withdrawalController, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('CONFIRMAÇÃO DE RETIRADA'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Column(
                  children: [
                    CustomCardWidget(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.25,
                      backgroundColor: AppColors.white,
                      showBorder: true,
                      borderWidth: 2,
                      borderColor: AppColors.green,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.00,
                            top: screenHeight * 0.01,
                            bottom: screenHeight * 0.02),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/front_desk_icon.png',
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.08,
                            ),
                            const SizedBox(width: 17),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Com atendente no balcão',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  // SizedBox(height: 40),
                                  SizedBox(height: screenHeight * 0.045),
                                  const Text(
                                    'Retire seu veículo com um de nosso atendentes',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Escolha o modelo na hora da retirada',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Agilidade na retirada',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '+200 pontos de fidelidade',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '50 pontos de milhas',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomCardWidget(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.25,
                      backgroundColor: AppColors.white,
                      showBorder: true,
                      borderWidth: 2,
                      borderColor: AppColors.green,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18, top: 5, right: 30, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dados da reserva',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Nome do veículo: ${withdrawalController.title}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Local da retirada: ${withdrawalController.pickupLocation}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Local da devolução: ${withdrawalController.returnLocation}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Data da retirada: ${withdrawalController.pickupDateTime}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Data da devolução: ${withdrawalController.returnDateTime}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 120, // Altura do bottom sheet
              width: double.infinity, // Largura total
              color: AppColors.darkGray,
              child: Padding(
                padding: const EdgeInsets.only(left: 17, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Total previsto',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(width: 156),
                        Text(
                          'R\$ 97,16/dia',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'A diária não está incluse nenhum valor adicional',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Container(
                      height: 63,
                      width: 360,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'CONFIRMAR',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.green),
                        ),
                      ),
                    )
                    // ButtonWidget(
                    //   nameButton: 'CONFIRMAR',
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/home');
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
