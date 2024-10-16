import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_of_vehicle/views/home/widgets/reservation_history_card.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';

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
            const Center(
              child: ReservationHistoryCard(
                title: 'HISTÓRICO DE RESERVAS',
                welcome: 'Olá, Fulano',
                keyStatusReservation: 'Reservas: ',
                statusReservation: 'No momento você não possui reservas',
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
