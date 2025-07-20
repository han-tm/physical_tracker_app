import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'PreRegistrationData.dart';

class PreRegistrationStorage {
  static const _key = 'pre_registration_data';

  static Future<void> save(PreRegistrationData data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(data.toJson());
    await prefs.setString(_key, jsonStr);
  }

  static Future<PreRegistrationData?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return null;
    final jsonMap = jsonDecode(jsonStr);
    return PreRegistrationData.fromJson(jsonMap);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}