import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/card/base_card_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/custom_card_widget.dart';

class VehicleSelectionScreen extends StatefulWidget {
  const VehicleSelectionScreen({super.key});

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
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
              CustomCardWidget(
                width: 360,
                height: 287,
                backgroundColor: Colors.white,
                showBorder: true,
                borderColor: AppColors.darkGray,
                borderWidth: 2,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FIAT ARGO 1.0 OU SIMILAR',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                              color: AppColors.darkLeafGreen,
                            ),
                          ),
                          SizedBox(height: 118),
                          Text(
                            'R\$ 79,16/dia',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'R\$ 219,90/total',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            'Esse valor é apenas a diária',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        'assets/images/cars/fiat_argo.png',
                        width: 257,
                        height: 300,
                      ),
                      top: -15,
                      left: 138,
                      right: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
