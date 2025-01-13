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

  static String? validateDocumentNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o número do documento*';
    }
    return null;
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
