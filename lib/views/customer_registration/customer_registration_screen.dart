import "package:flutter/material.dart";
import "package:rental_of_vehicle/controllers/customer/customer_validation_controller.dart";
import "package:rental_of_vehicle/models/customer_registration_models/customer_validation_model.dart";
import "package:rental_of_vehicle/views/widgets/button/button_widget.dart";
import "package:rental_of_vehicle/views/widgets/button/radio_button_group_widget.dart";
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
  final ValueNotifier<bool> isButtonEnable = ValueNotifier(false);

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
  void initState() {
    super.initState();
    controller.nameController.addListener(_updateButtonState);
    controller.countryController.addListener(_updateButtonState);
    controller.documentTypeController.addListener(_updateButtonState);
    controller.documentNumberController.addListener(_updateButtonState);
    controller.phoneNumberController.addListener(_updateButtonState);
    controller.phoneNumberConfirmationController
        .addListener(_updateButtonState);
  }

  @override
  void dispose() {
    controller.nameController.removeListener(_updateButtonState);
    controller.countryController.removeListener(_updateButtonState);
    controller.documentTypeController.removeListener(_updateButtonState);
    controller.documentNumberController.removeListener(_updateButtonState);
    controller.phoneNumberController.removeListener(_updateButtonState);
    controller.phoneNumberConfirmationController
        .removeListener(_updateButtonState);
    super.dispose();
  }

  void _updateButtonState() {
    final isValid = controller.nameController.text.isNotEmpty &&
        controller.documentTypeController.text.isNotEmpty &&
        controller.documentNumberController.text.isNotEmpty &&
        controller.phoneNumberController.text.isNotEmpty &&
        controller.phoneNumberConfirmationController.text.isNotEmpty &&
        controller.selectGender != null;
    isButtonEnable.value = isValid;
  }

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
                  CustomRadioGroup(
                    title: 'Sexo',
                    options: genders,
                    selectedOption: controller.selectGender,
                    showError: _showGenderError,
                    onOptionSelected: (value) {
                      setState(() {
                        controller.selectGender = value;
                        _showGenderError = false;
                        _updateButtonState();
                      });
                    },
                    labelBuilder: (option) => option,
                  ),
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
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isButtonEnable,
                      builder: (context, enable, child) {
                        return ButtonWidget(
                          nameButton: 'Próximo',
                          enable: enable,
                          onPressed: () {
                            setState(() {
                              _showGenderError =
                                  controller.selectGender == null;
                            });

                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              controller.validateForm();
                            }
                          },
                        );
                      },
                    ),
                  ),
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
