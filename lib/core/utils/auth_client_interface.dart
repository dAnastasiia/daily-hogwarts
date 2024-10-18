import 'package:daily_hogwarts/core/data/auth_user.dart';
import 'package:daily_hogwarts/core/data/user_model.dart';

abstract class AuthClientInterface {
  Stream<AuthUser?> authStateChanges();
  Future<AuthUserCredential> login(String email, String password);
  Future<String> signup(String email, String password, String username);
  Future<void> logout();
  Future<UserModel?> getUserData(String uid);
  Future<void> setUserData(String uid, dynamic payload);
}
