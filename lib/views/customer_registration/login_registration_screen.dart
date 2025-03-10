import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/customer/login_registration_controller.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/customer_data_model.dart';
import 'package:rental_of_vehicle/models/login_registration_models/login_validation_model.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/text_form_field_widget/custom_text_form_field_widget.dart';

class LoginRegistrationScreen extends StatefulWidget {
  const LoginRegistrationScreen({super.key});

  @override
  State<LoginRegistrationScreen> createState() =>
      _LoginRegistrationScreenState();
}

class _LoginRegistrationScreenState extends State<LoginRegistrationScreen> {
  final controller = LoginRegistrationController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    CustomerData? customerData;
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
                  controller: controller.emailController,
                  labelText: 'E-mail',
                  validator: LoginRegistrationValidationModel.validateEmail,
                ),
                CustomTextFormFieldWidget(
                  controller: controller.emailConfirmationController,
                  labelText: 'Confirme seu e-mail',
                  validator: LoginRegistrationValidationModel
                      .validateEmailConfirmation,
                ),
                CustomTextFormFieldWidget(
                  controller: controller.passwordController,
                  labelText: 'Senha',
                  isPasswordField: true,
                  validator: LoginRegistrationValidationModel.validatePassword,
                ),
                CustomTextFormFieldWidget(
                  controller: controller.passwordConfirmationController,
                  labelText: 'Confirme sua senha',
                  isPasswordField: true,
                  validator: LoginRegistrationValidationModel
                      .validatePasswordConfirmation,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
