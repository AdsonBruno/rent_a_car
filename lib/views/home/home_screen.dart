import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/dashed_line_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 21, right: 21, bottom: 55, left: 21),
              child: Text(
                'Meus Dados',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Center(
              child: Material(
                elevation: 50,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 153,
                  width: 388,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.green,
                  ),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30, top: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, Adson',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 17),
                            Row(
                              children: [
                                Text(
                                  'Reservas: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'No momento você não possui reservas',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 108.5,
                        left: 27.5,
                        right: 27.5,
                        child: CustomPaint(
                          size: const Size(400, 1),
                          painter: DashedLinePainter(),
                        ),
                      ),
                      const Positioned(
                        top: 120,
                        left: 104,
                        right: 104,
                        child: Text(
                          'HISTÓRICO DE RESERVAS',
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 65),
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/person_icon.svg'),
                    const SizedBox(width: 24.17),
                    const Text('Dados pessoais'),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFB1ABAB),
              thickness: 1.0,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/address_icon.svg'),
                  const SizedBox(width: 14),
                  const Text('Endereço'),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFB1ABAB),
              thickness: 1.0,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/car.svg'),
                  const SizedBox(width: 14),
                  const Text('Locações'),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFB1ABAB),
              thickness: 1.0,
              height: 1,
            ),
          ],
        ),
        bottomNavigationBar: Container(
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
                    nameButton: 'RESERVAS',
                    onPressed: () {},
                  ),
                  ButtonWidget(
                    icon: 'assets/icons/person_icon.svg',
                    nameButton: 'PERFIL',
                    onPressed: () {},
                  ),
                  ButtonWidget(
                    icon: 'assets/icons/home_icon.svg',
                    nameButton: 'INÍCIO',
                    onPressed: () {},
                    color: AppColors.greenSelected,
                  ),
                  ButtonWidget(
                    icon: 'assets/icons/history_icon.svg',
                    nameButton: 'HISTÓRICO',
                    onPressed: () {},
                  ),
                  ButtonWidget(
                    icon: 'assets/icons/exit_icon.svg',
                    nameButton: 'SAIR',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
