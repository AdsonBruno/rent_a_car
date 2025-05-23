import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/models/customer_registration_models/user_data_model.dart';
import 'package:rental_of_vehicle/views/booking_detail/booking_details_screen.dart';
import 'package:rental_of_vehicle/views/customer_registration/customer_registration_screen.dart';
import 'package:rental_of_vehicle/views/customer_registration/login_registration_screen.dart';
import 'package:rental_of_vehicle/views/history/history_screen.dart';
import 'package:rental_of_vehicle/views/home/vehicle_selection_screen.dart';
import 'package:rental_of_vehicle/views/home/withdrawal_confirmation.dart';
import 'package:rental_of_vehicle/views/profile/profile_screen.dart';
import 'package:rental_of_vehicle/views/onboarding/onboarding_screen.dart';
import 'package:rental_of_vehicle/views/login/login_screen.dart';

import '../../customer_registration/confirmation_registrations_screen.dart';
import '../../home/home_screnn.dart';

class AppRoutes {
  static const String onborading = '/onboarding';
  static const String customerRegistration = '/customer_registration';
  static const String loginRegistration = '/login_registration';
  static const String profile = '/profile';
  static const String history = '/history';
  static const String bookingDetail = '/booking_details';
  static const String confirmationRegistration = '/confirmation_registration';
  static const String login = '/login';
  static const String home = '/home';
  static const String vehicleSelection = '/vehicle_selection';
  static const String withdrawalConfirmation = '/withdrawal_confirmation';

  static Map<String, WidgetBuilder> routes = {
    onborading: (context) => const OnboardingScreen(),
    customerRegistration: (contex) => const CustomerRegistrationScreen(),
    loginRegistration: (context) => const LoginRegistrationScreen(),
    profile: (context) => const ProfileScreen(),
    history: (context) => const HistoryScreen(),
    bookingDetail: (context) => const BookingDetailsScreen(),
    confirmationRegistration: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as UserDataModel;
      return ConfirmationRegistrationScreen(userData: args);
    },
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    vehicleSelection: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return VehicleSelectionScreen(vehicleData: args);
    },
    withdrawalConfirmation: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      return WithdrawalConfirmation(vehicleData: args);
    },
  };
}
