import "package:flutter/material.dart";
import "package:rental_of_vehicle/controllers/customer/customer_validation_controller.dart";
import "package:rental_of_vehicle/models/customer_registration_models/customer_validation_model.dart";
import "package:rental_of_vehicle/views/core/app_colors.dart";
import "package:rental_of_vehicle/views/widgets/button/button_widget.dart";
import "package:rental_of_vehicle/views/widgets/slector_document_widget/document_type_selector_widget.dart";
import "package:rental_of_vehicle/views/widgets/text_form_field_widget/custom_text_form_field_widget.dart";

class CustomerRegistrationScreen extends StatefulWidget {
  const CustomerRegistrationScreen({super.key});

  @override
  State<CustomerRegistrationScreen> createState() =>
      _CustomerRegistrationScreenState();
}

class _CustomerRegistrationScreenState
    extends State<CustomerRegistrationScreen> {
  final controller = CustomerValidationController();
  int currentStep = 0;
  String? selectedDocumentType;
  String? selectedGender;
  String? genderError;
  bool isNameError = false;
  bool _showGenderError = false;

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
              key: controller.formKey,
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
                  CustomTextFormFieldWidget(
                    controller: controller.nameController,
                    labelText: 'Nome completo',
                    validator: CustomerValidationModel.validateName,
                  ),
                  CustomTextFormFieldWidget(
                    controller: controller.countryController,
                    labelText: 'País de nascimento',
                    validator: CustomerValidationModel.validateCountry,
                  ),
                  CustomTextFormFieldWidget(
                    controller: controller.documentTypeController,
                    labelText: 'Tipo de documento',
                    validator: CustomerValidationModel.validateDocumentType,
                    readOnly: true,
                    onTap: () => _showDocumentTypeSelector(context),
                  ),
                  CustomTextFormFieldWidget(
                    keyBoardType: TextInputType.number,
                    controller: controller.documentNumberController,
                    labelText: 'Número de documento',
                    validator: (value) =>
                        CustomerValidationModel.validateDocumentNumber(
                      value,
                      controller.documentTypeController.text,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Sexo',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color:
                          _showGenderError ? AppColors.red700 : AppColors.green,
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
                                  Text(
                                    gender,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      color: _showGenderError
                                          ? AppColors.red700
                                          : AppColors.green,
                                    ),
                                  ),
                                  Radio<String>(
                                    activeColor: AppColors.green,
                                    value: gender,
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (states) => _showGenderError
                                          ? AppColors.red700
                                          : AppColors.green,
                                    ),
                                    groupValue: controller.selectGender,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setGender(value);
                                        _showGenderError = false;
                                      });
                                    },
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                  if (_showGenderError && controller.validateGender() != null)
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          controller.validateGender()!,
                          style: const TextStyle(
                              color: AppColors.red700, fontSize: 13),
                        )),
                  CustomTextFormFieldWidget(
                    keyBoardType: TextInputType.phone,
                    controller: controller.phoneNumberController,
                    labelText: 'Celular',
                    validator: CustomerValidationModel.validatePhoneNumber,
                  ),
                  CustomTextFormFieldWidget(
                    controller: controller.phoneNumberConfirmationController,
                    labelText: 'Confirmar celular',
                    validator: (_) =>
                        controller.validatePhoneNumberConfirmation(),
                  ),
                  const SizedBox(height: 60),
                  Center(
                      child: ButtonWidget(
                          nameButton: 'Próximo',
                          onPressed: () {
                            setState(() {
                              _showGenderError =
                                  controller.updateGenderErrorState();
                              controller.validateForm();
                            });
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
          return const DocumentTypeSelectorDialogWidget(
              documentTypes: ['CPF', 'RG']);
        });

    if (result != null) {
      setState(() {
        controller.documentTypeController.text = result;
      });
    }
  }
}
