class LoginRegistrationValidationModel {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o seu email';
    }
    return null;
  }

  static String? validateEmailConfirmation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Os emails não coincidem';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a senha';
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? value) {
    if (value == null || value.isEmpty) {
      return 'As senhas não coincidem';
    }
    return null;
  }
}
