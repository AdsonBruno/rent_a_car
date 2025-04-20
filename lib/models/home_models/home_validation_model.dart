class HomeValidationModel {
  static String? validateVehicleWithdrawal(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o local de retirada do veículo*';
    }
    return null;
  }

  static String? validateReturnVehicle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o local de devolução do veículo*';
    }
    return null;
  }

  static String? validateDateOfWithdrawal(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a data de retirada do veículo*';
    }
    return null;
  }

  static String? validateReturnDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a data de devolução do veículo*';
    }
    return null;
  }
}
