import 'dart:convert';

import 'package:HerdID/model/user.dart';
import 'package:HerdID/services/shared_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/app_constants.dart';

class SharedPrefImplService implements SharedPrefService {
  @override
  Future<User?> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(AppConstants.userPrefKey);

    if (user == null) return null;

    return User.fromJson(json.decode(user));
  }

  @override
  Future<void> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(AppConstants.userPrefKey, jsonEncode(user.toJson()));
  }
}
