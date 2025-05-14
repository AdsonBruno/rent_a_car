import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_vehicle/controllers/home_controller/withdrawal_confirmation_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/core/app_text_styles.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:rental_of_vehicle/views/widgets/card/attendant_features_card_widget.dart';

import '../widgets/card/custom_card_widget.dart';
import '../widgets/card/reservation_details_card_widget.dart';

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
                    const AttendantFeaturesCardWidget(),
                    const SizedBox(height: 20),
                    ReservationDetailsCardWidget(
                      cardTitle: 'Dados da reserva',
                      title: withdrawalController.title!,
                      pickupLocation: withdrawalController.pickupLocation!,
                      returnLocation: withdrawalController.returnLocation!,
                      pickupDateTime: withdrawalController.pickupDateTime!,
                      returnDateTime: withdrawalController.returnDateTime!,
                    ),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 140, // Altura do bottom sheet
              width: double.infinity, // Largura total
              color: AppColors.darkGray,
              child: Padding(
                padding: const EdgeInsets.only(left: 17, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Total previsto',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(width: 156),
                        Text(
                          'R\$ ${withdrawalController.totalPrice}',
                          style: const TextStyle(
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
                    const SizedBox(height: 10),
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
