import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/user_data_model.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:rental_of_vehicle/views/widgets/card/dashed_line_painter.dart';
import 'package:rental_of_vehicle/views/widgets/modal/show_modal_widget.dart';

class ConfirmationRegistrationScreen extends StatefulWidget {
  final UserDataModel userData;

  const ConfirmationRegistrationScreen({super.key, required this.userData});

  @override
  State<ConfirmationRegistrationScreen> createState() =>
      _ConfirmationRegistrationScreenState();
}

class _ConfirmationRegistrationScreenState
    extends State<ConfirmationRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = widget.userData;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Confirmação de Cadastro',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDataTile('Nome completo: ', userData.fullName),
              _buildDataTile('País: ', userData.country),
              _buildDataTile('Tipo de documento: ', userData.documentType),
              _buildDataTile('Número do documento: ', userData.documentNumber),
              _buildDataTile('Gênero: ', userData.gender),
              _buildDataTile('Número do telefone: ', userData.phoneNumber),
              _buildDataTile('Email: ', userData.email),
              const SizedBox(height: 20),
              ButtonWidget(
                  nameButton: 'Confirmar',
                  onPressed: () {
                    _showRegistrationConfirmation(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: AppColors.greenTextButton,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomPaint(
            size: const Size(400, 2),
            painter: DashedLinePainter(dashColor: AppColors.black),
          ),
        ],
      ),
    );
  }

  Future<void> _showRegistrationConfirmation(BuildContext context) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return const ShowModalDialogWidget(
            image: 'assets/icons/success_icon.png',
            data: [
              'Parabéns!',
              'Cadastro realizado com sucesso!',
              'Agora você pode alugar um veículo!',
            ],
          );
        });
  }
}
