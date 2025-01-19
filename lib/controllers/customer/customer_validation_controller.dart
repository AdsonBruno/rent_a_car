import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/customer_validation_model.dart';

class CustomerValidationController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final documentTypeController = TextEditingController();
  final documentNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final phoneNumberConfirmationController = TextEditingController();
  final genderController = TextEditingController();

  bool showGenderError = false;

  String? selectGender;

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool updateGenderErrorState() {
    showGenderError = validateGender() != null;
    return showGenderError;
  }

  String? validatePhoneNumberConfirmation() {
    return CustomerValidationModel.validatePhoneConfirmation(
      phoneNumberController.text,
      phoneNumberConfirmationController.text,
    );
  }

  void setGender(String? gender) {
    selectGender = gender;
  }

  String? validateGender() {
    return selectGender == null ? 'Selecione um gênero*' : null;
  }
}
