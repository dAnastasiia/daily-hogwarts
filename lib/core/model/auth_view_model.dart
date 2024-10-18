import 'dart:async';

import 'package:daily_hogwarts/core/api/firebase_client.dart';
import 'package:daily_hogwarts/core/data/auth_payload.dart';
import 'package:daily_hogwarts/core/data/auth_user.dart';
import 'package:daily_hogwarts/core/data/user_model.dart';
import 'package:daily_hogwarts/core/utils/enums/auth_status.dart';
import 'package:daily_hogwarts/core/utils/enums/house.dart';
import 'package:daily_hogwarts/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository(FirebaseClient());
  late final StreamSubscription<AuthUser?> _authStateSubscription;

  bool _isAuthenticated = false;
  bool _isLoading = false;
  AuthStatus _status = AuthStatus.notLoggedIn;
  String _errorMessage = '';
  House _house = House.gryffindor;
  UserModel? _user;

  AuthViewModel() {
    _authStateSubscription =
        _authRepository.authStateChanges().listen((AuthUser? user) {
      if (user != null) {
        _loadUser(user.uid);
      } else {
        _setUser(null);
      }
    });
  }

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  House get house => _house;
  UserModel? get user => _user;
  AuthStatus get status => _status;
  String get errorMessage => _errorMessage;

  Future<void> login(
    AuthPayload payload,
  ) =>
      _performAction(
        () async {
          AuthUserCredential userCredential =
              await _authRepository.login(payload.email, payload.password!);

          await _loadUser(userCredential.user.uid);
          _status = AuthStatus.loggedIn;
        },
      );

  Future<void> signup(
    AuthPayload payload,
  ) =>
      _performAction(
        () async {
          String uid = await _authRepository.signup(
            payload.email,
            payload.password!,
            payload.username!,
          );

          await _authRepository.setUserData(uid, payload);
          await login(payload);
        },
      );

  Future<void> logout() => _performAction(
        () async {
          await _authRepository.logout();
          _setUser(null);
        },
      );

  Future<void> _loadUser(String uid) => _performAction(
        () async {
          UserModel? user = await _authRepository.getUserData(uid);

          _setUser(user);

          if (_user != null) {
            _house = House.fromString(_user!.house);
          }
        },
      );

  Future<void> _performAction(
    Function() action,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      await action();
      _errorMessage = "";
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _setUser(UserModel? user) {
    _user = user;
    _isAuthenticated = user != null;
    _status = user != null ? AuthStatus.loggedIn : AuthStatus.notLoggedIn;

    notifyListeners();
  }

  void resetError() {
    _errorMessage = "";
    notifyListeners();
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }
}
