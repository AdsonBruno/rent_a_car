import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/base_card_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/vehicle_selection_card_widget.dart';

class VehicleSelectionScreen extends StatefulWidget {
  const VehicleSelectionScreen({super.key});

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
  late final int days;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    days = ModalRoute.of(context)?.settings.arguments as int;
    print(days);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'MODELOS DISPONÍVEIS',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              VehicleSelectionCard(
                title: 'FIAT ARGO 1.0 OU SIMILAR',
                imageUrl: 'assets/images/cars/fiat_argo.png',
                dailyPrice: 79.16,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'HYUNDAI HB20S 1.0 OU SIMILAR',
                imageUrl: 'assets/images/cars/hyundai_hb20s.png',
                dailyPrice: 107.08,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'FIAT CRONOS 1.3 AT',
                imageUrl: 'assets/images/cars/fiat_cronos.png',
                dailyPrice: 116.08,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'HILUX CABINE DUPLA AT',
                imageUrl: 'assets/images/cars/toyota_hilux.png',
                dailyPrice: 450.30,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'JEEP RENEGADE 1.3 AT',
                imageUrl: 'assets/images/cars/jeep_renegade.png',
                dailyPrice: 148.46,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'JEEP COMPASS 1.3 TURBO AT',
                imageUrl: 'assets/images/cars/jeep_compass.png',
                dailyPrice: 292.46,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'FIAT STRADA CABINE DUPLA 1.3',
                imageUrl: 'assets/images/cars/fiat_strada_cabine_dupla.png',
                dailyPrice: 292.46,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'FIAT TORO 1.3 TURBO',
                imageUrl: 'assets/images/cars/fiat_toro.png',
                dailyPrice: 384.26,
                days: days,
              ),
              const SizedBox(height: 17),
              VehicleSelectionCard(
                title: 'NISSAN KICKS 1.6 OU SIMILAR',
                imageUrl: 'assets/images/cars/nissan_kicks.png',
                dailyPrice: 343.76,
                days: days,
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
