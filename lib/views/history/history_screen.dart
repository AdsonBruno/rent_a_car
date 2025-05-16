import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_of_vehicle/controllers/history/history_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/base_card_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/reservation_details_card_widget.dart';

class HistoryScreen extends StatelessWidget {
  final Map<String, dynamic>? locationData;

  const HistoryScreen({
    super.key,
    this.locationData,
  });

  @override
  Widget build(BuildContext context) {
    final historyController = Provider.of<HistoryController>(context);

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
            ),
          ),
        ),
        body: historyController.reservations.isEmpty
            ? const Center(
                child: Text(
                  'No momento você não possui reservas',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: historyController.reservations.length,
                itemBuilder: (context, index) {
                  final reservation = historyController.reservations[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReservationDetailsCardWidget(
                      cardTitle: 'Dados da reserva',
                      title: reservation['title'],
                      pickupLocation: reservation['pickupLocation'],
                      returnLocation: reservation['returnLocation'],
                      pickupDateTime: reservation['pickupDateTime'],
                      returnDateTime: reservation['returnDateTime'],
                    ),
                  );
                },
              ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
