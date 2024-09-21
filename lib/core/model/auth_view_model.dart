import 'package:daily_hogwarts/core/utils/enums/houses.dart';
import 'package:flutter/material.dart';

// * It will be replaced with the real authorization logic later
class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;
  Houses house = Houses.gryffindor;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void signup() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
