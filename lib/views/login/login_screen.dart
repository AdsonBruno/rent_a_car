import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/controllers/login_controller/login_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:rental_of_vehicle/views/widgets/text_form_field_widget/custom_text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.only(left: 19, top: 50, right: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Olá!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Inter',
                        color: AppColors.green,
                      )),
                  const Text(
                    'Acesse sua conta ou cadastre-se',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 100),
                  Stack(children: [
                    Card(
                      elevation: 7.0,
                      color: AppColors.white, //AppColors.black,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CustomTextFormFieldWidget(
                              controller: controller.emailController,
                              labelText: 'E-mail',
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormFieldWidget(
                              controller: controller.passwordController,
                              isPasswordField: true,
                              labelText: 'Senha',
                            ),
                            const SizedBox(height: 56),
                            ButtonWidget(nameButton: 'ENTRAR', onPressed: () {})
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
