import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/routes/app_routes.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> navigateToProfile(BuildContext context) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, AppRoutes.profile);
    _setLoading(false);
  }

  Future<void> navigateToRegistration(BuildContext context) async {
    _setLoading(true);
    await Navigator.pushNamed(context, AppRoutes.customerRegistration);
    _setLoading(false);
  }
}
