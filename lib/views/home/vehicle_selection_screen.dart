import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/home_controller/vehicle_selection_controller.dart';
import 'package:rental_of_vehicle/views/widgets/card/vehicle_selection_card_widget.dart';
import 'package:provider/provider.dart';

class VehicleSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> vehicleData;
  const VehicleSelectionScreen({
    super.key,
    required this.vehicleData,
  });

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
  late final int days;

  final List<Map<String, dynamic>> vehicles = [
    {
      'title': 'FIAT ARGO 1.0 OU SIMILAR',
      'imageUrl': 'assets/images/cars/fiat_argo.png',
      'dailyPrice': 79.16,
    },
    {
      'title': 'HYUNDAI HB20S 1.0 OU SIMILAR',
      'imageUrl': 'assets/images/cars/hyundai_hb20s.png',
      'dailyPrice': 107.08,
    },
    {
      'title': 'FIAT CRONOS 1.3 AT',
      'imageUrl': 'assets/images/cars/fiat_cronos.png',
      'dailyPrice': 116.08,
    },
    {
      'title': 'HILUX CABINE DUPLA AT',
      'imageUrl': 'assets/images/cars/toyota_hilux.png',
      'dailyPrice': 450.30,
    },
    {
      'title': 'JEEP RENEGADE 1.3 AT',
      'imageUrl': 'assets/images/cars/jeep_renegade.png',
      'dailyPrice': 148.46,
    },
    {
      'title': 'JEEP COMPASS 1.3 TURBO AT',
      'imageUrl': 'assets/images/cars/jeep_compass.png',
      'dailyPrice': 292.46,
    },
    {
      'title': 'FIAT STRADA CABINE DUPLA 1.3',
      'imageUrl': 'assets/images/cars/fiat_strada_cabine_dupla.png',
      'dailyPrice': 292.46,
    },
    {
      'title': 'FIAT TORO 1.3 TURBO',
      'imageUrl': 'assets/images/cars/fiat_toro.png',
      'dailyPrice': 384.26,
    },
    {
      'title': 'NISSAN KICKS 1.6 OU SIMILAR',
      'imageUrl': 'assets/images/cars/nissan_kicks.png',
      'dailyPrice': 343.76,
    },
  ];

  @override
  void initState() {
    super.initState();
    days = widget.vehicleData['days']
        as int; // Exemplo: recuperar o "days" enviado
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VehicleSelectionController(),
      child: Consumer<VehicleSelectionController>(
        builder: (context, selectionController, child) {
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
                  children: List.generate(vehicles.length, (index) {
                    final vehicle = vehicles[index];
                    return Column(
                      children: [
                        VehicleSelectionCardWidget(
                          title: vehicle['title'],
                          imageUrl: vehicle['imageUrl'],
                          dailyPrice: vehicle['dailyPrice'],
                          days: days,
                          isSelected:
                              selectionController.selectedVehicleIndex == index,
                          onTap: () {
                            selectionController.selectVehicle(index);

                            final vehicleData = {
                              'title': vehicle['title'],
                              'imageUrl': vehicle['imageUrl'],
                              'dailyPrice': vehicle['dailyPrice'],
                              'days': days,
                              'totalPrice': (vehicle['dailyPrice'] * days)
                                  .toStringAsFixed(2),
                              'pickupLocation':
                                  widget.vehicleData['pickupLocation'],
                              'returnLocation':
                                  widget.vehicleData['returnLocation'],
                              'pickupDateTime':
                                  widget.vehicleData['pickupDateTime'],
                              'returnDateTime':
                                  widget.vehicleData['returnDateTime'],
                            };

                            selectionController
                                .navigateToWithdrawalConfirmation(
                                    context, vehicleData);
                          },
                        ),
                        const SizedBox(height: 17),
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
