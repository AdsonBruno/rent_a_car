import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import 'custom_card_widget.dart';

class VehicleSelectionCardWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final double dailyPrice;
  final int days;

  const VehicleSelectionCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.dailyPrice,
    required this.days,
  });

  @override
  State<VehicleSelectionCardWidget> createState() =>
      _VehicleSelectionCardWidgetState();
}

class _VehicleSelectionCardWidgetState
    extends State<VehicleSelectionCardWidget> {
  bool _isSelected = false;

  double get totalPrice => widget.dailyPrice * widget.days;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      isButton: true,
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      width: 360,
      height: 287,
      backgroundColor: AppColors.white,
      showBorder: true,
      borderColor: _isSelected ? AppColors.darkGray : AppColors.darkLeafGreen,
      borderWidth: 2,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title, //'FIAT ARGO 1.0 OU SIMILAR',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: AppColors.darkLeafGreen,
                  ),
                ),
                const SizedBox(height: 118),
                Text(
                  'R\$ ${widget.dailyPrice.toStringAsFixed(2)}/dia',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'R\$ ${totalPrice.toStringAsFixed(2)}/total',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
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
            top: -15,
            left: 138,
            right: 10,
            child: Image.asset(
              widget.imageUrl, //'assets/images/cars/fiat_argo.png',
              width: 257,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
