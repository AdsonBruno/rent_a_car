import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rental_of_vehicle/controllers/login_controller/login_controller.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';
import 'package:rental_of_vehicle/views/widgets/button/button_widget.dart';
import 'package:rental_of_vehicle/views/widgets/text_form_field_widget/custom_text_form_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: -MediaQuery.of(context).size.width * 0.6,
                right: 140,
                child: SvgPicture.asset(
                  'assets/others/ellipse.svg',
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              Consumer<LoginController>(
                builder: (context, controller, _) {
                  return SingleChildScrollView(
                    reverse: true,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 50, right: 19),
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
                              color: AppColors.white,
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
                                    ButtonWidget(
                                      nameButton: 'ENTRAR',
                                      isLoading: controller.isLoading,
                                      onPressed: () =>
                                          controller.navigateToProfile(context),
                                    ),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      child: const Text(
                                        'AINDA NÃO TENHO CADASTRO',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.darkLeafGreen,
                                        ),
                                      ),
                                      onPressed: () => controller
                                          .navigateToRegistration(context),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
