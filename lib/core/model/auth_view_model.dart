import 'dart:async';

import 'package:daily_hogwarts/core/data/auth_payload.dart';
import 'package:daily_hogwarts/core/data/user_model.dart';
import 'package:daily_hogwarts/core/utils/enums/houses.dart';
import 'package:daily_hogwarts/features/auth/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  late final StreamSubscription<User?> _authStateSubscription;

  bool _isAuthenticated = false;
  bool _isLoading = false;
  House house = House.gryffindor;
  UserModel? _user;

  AuthViewModel() {
    _authStateSubscription =
        _authRepository.authStateChanges().listen((User? user) {
      if (user != null) {
        _loadUser(user.uid);
      } else {
        _setUser(null);
      }
    });
  }

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  UserModel? get user => _user;

  Future<void> login(
    AuthPayload payload,
    VoidCallback onSuccess,
    Function(String) onError,
  ) =>
      _performOperation(
        () async {
          UserCredential userCredential =
              await _authRepository.login(payload.email, payload.password!);

          await _loadUser(userCredential.user!.uid);
          onSuccess();
        },
        onError,
      );

  Future<void> signup(
    AuthPayload payload,
    VoidCallback onSuccess,
    Function(String) onError,
  ) =>
      _performOperation(
        () async {
          String uid = await _authRepository.signup(
            payload.email,
            payload.password!,
            payload.username!,
          );

          await _authRepository.setUserData(uid, payload);

          await login(
            payload,
            onSuccess,
            onError,
          );
        },
        onError,
      );

  Future<void> logout(
    VoidCallback onSuccess,
    Function(String) onError,
  ) =>
      _performOperation(
        () async {
          await _authRepository.logout();

          _setUser(null);
          onSuccess();
        },
        onError,
      );

  Future<void> _loadUser(String uid) => _performOperation(
        () async {
          _user = await _authRepository.getUserData(uid);

          if (_user != null) {
            _isAuthenticated = true;
            house = House.fromString(_user!.house);
          }
        },
        (e) => throw ErrorDescription(e.toString()),
      );

  Future<void> _performOperation(
    Function() action,
    Function(String) onError,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      await action();
    } catch (e) {
      onError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _setUser(UserModel? user) {
    _user = user;
    _isAuthenticated = user != null;
    notifyListeners();
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }
}
