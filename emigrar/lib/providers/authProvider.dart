import 'dart:convert';

import 'package:emigrar/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  CusUser user = CusUser();

  void setUser(CusUser user) {
    this.user = user;
    notifyListeners();
  }

  bool userExists() {
    if (user.uid != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadAuthCred() async {
    final prefs = await SharedPreferences.getInstance();

    String? userPref = prefs.getString('user');
    if (userPref == null) return;

    user = CusUser.fromJson(jsonDecode(userPref));
    print(user.uid);
  }

  Future<void> storeAuthCred() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", jsonEncode(user.toJson()));
  }
}
