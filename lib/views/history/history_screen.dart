import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/base_card_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Padding(
                  padding: EdgeInsets.only(
                    left: 74,
                  ),
                  child: Text(
                    'Minhas Locações',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  )),
            ),
            body: const SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: BaseCardWidget(
                      title: 'DETALHES DA RESERVA',
                      children: [
                        Text(
                          'Devolução',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          'AGÊNCIA CENTRO - ARAPIRACA - AL',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '05/04/2024',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  BaseCardWidget(
                    title: 'DETALHES DA RESERVA',
                    children: [
                      Text(
                        'Devolução',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 9),
                      Text(
                        'AGÊNCIA CENTRO - ARAPIRACA - AL',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '05/04/2024',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  BaseCardWidget(
                    title: 'DETALHES DA RESERVA',
                    children: [
                      Text(
                        'Devolução',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 9),
                      Text(
                        'AGÊNCIA CENTRO - ARAPIRACA - AL',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '05/04/2024',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  BaseCardWidget(
                    title: 'DETALHES DA RESERVA',
                    children: [
                      Text(
                        'Devolução',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 9),
                      Text(
                        'AGÊNCIA CENTRO - ARAPIRACA - AL',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '05/04/2024',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBarWidget(
              currentIndex: 3,
            )));
  }
}
