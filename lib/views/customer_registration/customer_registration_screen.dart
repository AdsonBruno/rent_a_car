import "dart:typed_data";

import "package:flutter/material.dart";
import "package:rental_of_vehicle/views/core/app_colors.dart";
import "package:rental_of_vehicle/views/widgets/button/button_widget.dart";

class CustomerRegistrationScreen extends StatefulWidget {
  const CustomerRegistrationScreen({super.key});

  @override
  State<CustomerRegistrationScreen> createState() =>
      _CustomerRegistrationScreenState();
}

class _CustomerRegistrationScreenState
    extends State<CustomerRegistrationScreen> {
  int currentStep = 0;
  String? selectedDocumentType;
  String? selectedGender;

  final name = TextEditingController();
  final country = TextEditingController();
  final documentType = TextEditingController();
  final documentNumber = TextEditingController();
  final phoneNumber = TextEditingController();
  final phoneNumberConfirmation = TextEditingController();

  final List<String> genders = [
    'Masculino',
    'Feminino',
    'Outro',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'CADASTRO',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dados pessoais',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.green,
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'País de nascimento',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.green,
                    ),
                  ),
                ),
                TextField(
                  controller: documentType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de documento',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.green,
                    ),
                  ),
                  readOnly: true,
                  onTap: () => _showDocumentTypeSelector(context),
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Número do documento',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sexo',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: AppColors.green,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: genders
                        .map((gender) => Column(
                              children: [
                                Text(gender),
                                Radio<String>(
                                    activeColor: AppColors.green,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (!states
                                            .contains(MaterialState.selected)) {
                                          return AppColors.greenSelected;
                                        }
                                        return null;
                                      },
                                    ),
                                    value: gender,
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    })
                              ],
                            ))
                        .toList(),
                  ),
                ),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Celular',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.green,
                    ),
                  ),
                ),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Confirmar celular',
                    labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                    child:
                        ButtonWidget(nameButton: 'Próximo', onPressed: () {})),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDocumentTypeSelector(BuildContext context) async {
    final result = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Selecione o tipo de documento',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                color: AppColors.black,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    'CPF',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: AppColors.black,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, 'CPF'),
                ),
                ListTile(
                  title: const Text(
                    'RG',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: AppColors.black,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, 'RG'),
                )
              ],
            ),
          );
        });

    if (result != null) {
      setState(() {
        documentType.text = result;
      });
    }
  }
}
