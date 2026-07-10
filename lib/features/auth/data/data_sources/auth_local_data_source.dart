import 'package:flutter_task09_team_clean_architecture_app_beg/core/constant/app_key.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/shared_preferences_helper.dart';

class AuthLocalDataSource {
  Future<void> saveAccessToken(String token) async {
    await SharedPreferencesHelper.saveString(AppKey.token, token);
  }

  Future<String?> getAccessToken() async {
    return SharedPreferencesHelper.getString(AppKey.token);
  }

  Future<void> clearTokens() async {
    final prefs = await SharedPreferencesHelper.instance;
    prefs.remove(AppKey.token);
  }
}
