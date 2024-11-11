import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/location_card_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da reserva'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 21, right: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalhes do contrato',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppColors.greenTextButton,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Confira todas as informações do seu contrato',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w200,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 5),
            LocationCardWidget(
              titleCard: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.white,
                ),
                SizedBox(width: 6),
                Text(
                  'Locação finalizada',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
              ],
              cardContent: [
                Text(
                  'CONTRATO',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.pinkishGray,
                  ),
                ),
                Text(
                  'RAC004178',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Informações de retirada e devolução',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: AppColors.darkLeafGreen,
              ),
            ),
            Divider(color: AppColors.black),
            LocationCardWidget(
              titleCard: [
                Text(
                  'Retirada',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
              ],
              cardContent: [
                Text(
                  'LOCAL',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightLimeGreen,
                  ),
                ),
                Text(
                  'AGEÊNCIA CENTRO - ARAPIRACA - AL',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'DATA E HORA',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightLimeGreen,
                  ),
                ),
                Text(
                  'terça-feira, 05 de mar. de 2024 às 11:17',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'KM DO CARRO',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightLimeGreen,
                  ),
                ),
                Text(
                  '218886 Km',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white,
                  ),
                ),
              ],
              screenHeight: 196,
              screenWidth: 388,
            ),
            SizedBox(height: 5),
            LocationCardWidget(
              titleCard: [
                Text(
                  'Retirada',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
              ],
              cardContent: [
                Text(
                  'LOCAL',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightLimeGreen,
                  ),
                ),
                Text(
                  'AGEÊNCIA CENTRO - ARAPIRACA - AL',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'DATA E HORA',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightLimeGreen,
                  ),
                ),
                Text(
                  'terça-feira, 05 de mar. de 2024 às 11:17',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'KM DO CARRO',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightLimeGreen,
                  ),
                ),
                Text(
                  '218886 Km',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white,
                  ),
                ),
              ],
              screenHeight: 196,
              screenWidth: 388,
            )
          ],
        ),
      ),
    ));
  }
}
