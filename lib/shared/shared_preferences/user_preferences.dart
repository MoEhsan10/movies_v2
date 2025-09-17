import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _nameKey = 'user_name';
  static const String _phoneKey = 'user_phone';
  static const String _emailKey = 'user_email';

  // Save user data during registration
  static Future<void> saveUserData({
    required String name,
    required String phone,
    String? email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
    await prefs.setString(_phoneKey, phone);
    if (email != null) {
      await prefs.setString(_emailKey, email);
    }
  }

  // Get user name
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

  // Get user phone
  static Future<String?> getUserPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_phoneKey);
  }

  // Get user email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  // Update user data
  static Future<void> updateUserData({
    String? name,
    String? phone,
    String? email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (name != null) {
      await prefs.setString(_nameKey, name);
    }
    if (phone != null) {
      await prefs.setString(_phoneKey, phone);
    }
    if (email != null) {
      await prefs.setString(_emailKey, email);
    }
  }

  // Clear user data on logout
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_phoneKey);
    await prefs.remove(_emailKey);
  }
}