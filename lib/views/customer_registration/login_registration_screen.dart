import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/customer/login_registration_controller.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/customer_data_model.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/user_data_model.dart';
import 'package:rental_of_vehicle/models/login_registration_models/login_validation_model.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:rental_of_vehicle/views/widgets/text_form_field_widget/custom_text_form_field_widget.dart';

class LoginRegistrationScreen extends StatefulWidget {
  const LoginRegistrationScreen({super.key});

  @override
  State<LoginRegistrationScreen> createState() =>
      _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState extends State<LoginRegistrationScreen> {
  final controller = LoginRegistrationController();
  final ValueNotifier<bool> isButtonEnable = ValueNotifier(false);
  CustomerData? customerData;

  @override
  void initState() {
    super.initState();
    controller.emailController.addListener(_updateButtonState);
    controller.emailConfirmationController.addListener(_updateButtonState);
    controller.passwordController.addListener(_updateButtonState);
    controller.passwordConfirmationController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    controller.emailController.removeListener(_updateButtonState);
    controller.emailConfirmationController.removeListener(_updateButtonState);
    controller.passwordController.removeListener(_updateButtonState);
    controller.passwordConfirmationController
        .removeListener(_updateButtonState);
    super.dispose();
  }

  void _updateButtonState() {
    final isValid = controller.emailController.text.isNotEmpty &&
        controller.emailConfirmationController.text.isNotEmpty &&
        controller.passwordController.text.isNotEmpty &&
        controller.passwordConfirmationController.text.isNotEmpty;
    isButtonEnable.value = isValid;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is CustomerData) {
      customerData = args;
    }

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
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const Text(
                    'Dados pessoais',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  CustomTextFormFieldWidget(
                    key: const Key('emailField'),
                    controller: controller.emailController,
                    labelText: 'E-mail',
                    validator: LoginRegistrationValidationModel.validateEmail,
                  ),
                  CustomTextFormFieldWidget(
                    key: const Key('emailConfirmationField'),
                    controller: controller.emailConfirmationController,
                    labelText: 'Confirme seu e-mail',
                    validator: LoginRegistrationValidationModel
                        .validateEmailConfirmation,
                  ),
                  CustomTextFormFieldWidget(
                    key: const Key('passwordField'),
                    controller: controller.passwordController,
                    labelText: 'Senha',
                    isPasswordField: true,
                    validator:
                        LoginRegistrationValidationModel.validatePassword,
                  ),
                  CustomTextFormFieldWidget(
                    key: const Key('passwordConfirmationField'),
                    controller: controller.passwordConfirmationController,
                    labelText: 'Confirme sua senha',
                    isPasswordField: true,
                    validator: LoginRegistrationValidationModel
                        .validatePasswordConfirmation,
                  ),
                  const SizedBox(height: 206),
                  Center(
                    child: ValueListenableBuilder<bool>(
                        valueListenable: isButtonEnable,
                        builder: (context, enable, child) {
                          return ButtonWidget(
                            nameButton: 'Próximo',
                            enable: enable,
                            onPressed: () {
                              if (controller.formKey.currentState?.validate() ??
                                  false) {
                                if (customerData != null) {
                                  final userData = UserDataModel(
                                    fullName: customerData!.name,
                                    country: customerData!.country,
                                    documentType: customerData!.documentType,
                                    documentNumber:
                                        customerData!.documentNumber,
                                    gender: customerData!.gender,
                                    phoneNumber: customerData!.phoneNumber,
                                    email: controller.emailController.text,
                                  );

                                  controller.navigateToNextPage(
                                      context, userData);
                                }
                                controller.validateForm();
                              }
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
