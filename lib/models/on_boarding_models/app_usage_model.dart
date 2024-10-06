import 'package:shared_preferences/shared_preferences.dart';

class AppUsageModel {
  static const String _firstUseKey = 'first_use';

  Future<bool> isFirstUse() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstUseKey) ?? true;
  }

  Future<void> setFisrtUseCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstUseKey, false);
  }
}
