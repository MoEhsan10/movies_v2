import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _userIdKey = 'user_id';
  static const String _nameKey = 'user_name';
  static const String _phoneKey = 'user_phone';
  static const String _emailKey = 'user_email';
  static const String _isLoggedInKey = 'is_logged_in';

  // Save user data during registration/login
  static Future<void> saveUserData({
    required String userId,
    required String name,
    required String phone,
    String? email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_nameKey, name);
    await prefs.setString(_phoneKey, phone);
    await prefs.setBool(_isLoggedInKey, true);
    if (email != null) {
      await prefs.setString(_emailKey, email);
    }
  }

  // Get user ID (CRITICAL for watchlist functionality)
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
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

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Get all user data at once
  static Future<Map<String, String?>> getAllUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'userId': prefs.getString(_userIdKey),
      'name': prefs.getString(_nameKey),
      'phone': prefs.getString(_phoneKey),
      'email': prefs.getString(_emailKey),
    };
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
    await prefs.remove(_userIdKey);
    await prefs.remove(_nameKey);
    await prefs.remove(_phoneKey);
    await prefs.remove(_emailKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  // Clear all app data (useful for debugging)
  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}