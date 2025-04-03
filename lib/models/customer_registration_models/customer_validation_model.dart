import 'package:cpf_cnpj_validator/cpf_validator.dart';

class CustomerValidationModel {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o seu nome completo*';
    }
    return null;
  }

  static String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe seu país de nascimento*';
    }
    return null;
  }

  static String? validateDocumentType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o tipo de documento*';
    }
    return null;
  }

  static String? validateDocumentNumber(String? value, String? documentType) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o número do documento*';
    }

    if (documentType == 'CPF') {
      if (!CPFValidator.isValid(value)) {
        return 'CPF inválido';
      }
    } else if (documentType == 'RG') {
      final cleanedValue = value.replaceAll(RegExp(r'[^\d]'), '');
      if (!isValidRG(cleanedValue)) {
        return 'RG inválido';
      }
    }
    return null;
  }

  static bool isValidRG(String rg) {
    return rg.length == 9 && RegExp(r'^\d{9}$').hasMatch(rg);
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o número do celular*';
    }
    return null;
  }

  static String? validatePhoneConfirmation(String phone, String? confirmation) {
    if (confirmation == null || confirmation.isEmpty) {
      return 'Por favor, confirme o número de celular*';
    }
    if (phone != confirmation) {
      return 'Os números de celular não correspondem';
    }
    return null;
  }

  static String? validateGender(String? gender) {
    if (gender != null) {
      return 'Por favor, selecione um gênero*';
    }
    return null;
  }
}
