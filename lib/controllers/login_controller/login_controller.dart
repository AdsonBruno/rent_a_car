import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
