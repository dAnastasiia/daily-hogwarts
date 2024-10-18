import 'dart:math';

import 'package:daily_hogwarts/core/data/auth_payload.dart';
import 'package:daily_hogwarts/core/data/auth_user.dart';
import 'package:daily_hogwarts/core/data/user_model.dart';
import 'package:daily_hogwarts/core/utils/auth_client_interface.dart';
import 'package:daily_hogwarts/core/utils/enums/house.dart';

class AuthRepository {
  final AuthClientInterface _authClient;

  AuthRepository(this._authClient);

  Stream<AuthUser?> authStateChanges() {
    return _authClient.authStateChanges();
  }

  Future<AuthUserCredential> login(String email, String password) async {
    return await _authClient.login(email, password);
  }

  Future<String> signup(String email, String password, String username) async {
    return await _authClient.signup(email, password, username);
  }

  Future<void> logout() async {
    await _authClient.logout();
  }

  Future<UserModel?> getUserData(String uid) async {
    return await _authClient.getUserData(uid);
  }

  Future<void> setUserData(String uid, AuthPayload payload) async {
    House house = _getRandomHouse();

    await _authClient.setUserData(
      uid,
      {
        'id': uid,
        'username': payload.username,
        'email': payload.email,
        'house': house.name,
      },
    );
  }

  House _getRandomHouse() {
    const houses = House.values;
    return houses[Random().nextInt(houses.length)];
  }
}
