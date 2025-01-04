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
  final _formKey = GlobalKey<FormState>();
  int currentStep = 0;
  String? selectedDocumentType;
  String? selectedGender;
  String? genderError;
  bool isNameError = false;

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
            child: Form(
              key: _formKey,
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
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Nome completo',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isNameError ? AppColors.red700 : AppColors.green,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          isNameError = true;
                        });
                        return 'Por favor, informe o seu nome completo*';
                      }
                      setState(() {
                        isNameError = false;
                      });
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'País de nascimento',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isNameError ? AppColors.red700 : AppColors.green,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          isNameError = true;
                        });
                        return 'Por favor, informe seu país de nascimento*';
                      }
                      setState(() {
                        isNameError = false;
                      });
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: documentType,
                    decoration: InputDecoration(
                      labelText: 'Tipo de documento',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isNameError ? AppColors.red700 : AppColors.green,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        isNameError = true;
                        return 'Por favor, informe o tipo de documento*';
                      }
                      isNameError = false;
                      return null;
                    },
                    readOnly: true,
                    onTap: () => _showDocumentTypeSelector(context),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número do documento',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isNameError ? AppColors.red700 : AppColors.green,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        isNameError = true;
                        return 'Por favor, informe o número do documento*';
                      }
                      isNameError = false;
                      return null;
                    },
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
                                      activeColor: isNameError
                                          ? AppColors.red700
                                          : AppColors.green,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                        (states) {
                                          if (!states.contains(
                                              MaterialState.selected)) {
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
                                          genderError = null;
                                        });
                                      })
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                  if (genderError != null)
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          genderError!,
                          style: const TextStyle(
                              color: AppColors.red700, fontSize: 13),
                        )),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Celular',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isNameError ? AppColors.red700 : AppColors.green,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        isNameError = true;
                        return 'Por favor, informe o número de celular*';
                      }
                      isNameError = false;
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Confirmar celular',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isNameError ? AppColors.red700 : AppColors.green,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        isNameError = true;
                        return 'Por favor, confirme o número do celular*';
                      }
                      isNameError = false;
                      return null;
                    },
                  ),
                  const SizedBox(height: 60),
                  Center(
                      child: ButtonWidget(
                          nameButton: 'Próximo',
                          onPressed: () {
                            validateForm();
                          })),
                  const SizedBox(height: 60),
                ],
              ),
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

  validateForm() {
    setState(() {
      genderError = selectedGender == null ? 'Selecione um gênero*' : null;
    });
    if (_formKey.currentState!.validate()) {
      print('válido');
    } else {
      print('inválido');
    }
  }
}
