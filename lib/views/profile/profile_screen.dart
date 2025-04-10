import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/profile/widgets/reservation_history_card.dart';
import 'package:rental_of_vehicle/views/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:rental_of_vehicle/views/widgets/button/icon_text_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            IconTextButtonWidget(
              iconPath: 'assets/icons/person_icon.svg',
              buttonName: 'Dados pessoais',
              onPressed: () {},
            ),
            const Divider(
              color: Color(0xFFB1ABAB),
              thickness: 1.0,
            ),
            IconTextButtonWidget(
              iconPath: 'assets/icons/address_icon.svg',
              buttonName: 'Endereço',
              onPressed: () {},
            ),
            const Divider(
              color: Color(0xFFB1ABAB),
              thickness: 1.0,
            ),
            IconTextButtonWidget(
              iconPath: 'assets/icons/car.svg',
              buttonName: 'Locações',
              onPressed: () {},
            ),
            const Divider(
              color: Color(0xFFB1ABAB),
              thickness: 1.0,
              height: 1,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 1),
      ),
    );
  }
}
