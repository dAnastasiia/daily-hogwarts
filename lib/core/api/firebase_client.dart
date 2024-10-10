import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_hogwarts/core/data/auth_user.dart';
import 'package:daily_hogwarts/core/data/user_model.dart';
import 'package:daily_hogwarts/core/utils/auth_client_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient implements AuthClientInterface {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<AuthUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_firebaseUserToAuthUser);
  }

  @override
  Future<AuthUserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _firebaseUserCredentialToAuthUserCredential(userCredential);
    } catch (error) {
      if (error is FirebaseAuthException) {
        throw Exception(
          error.message,
        );
      } else {
        throw Exception('Failed to login: $error');
      }
    }
  }

  @override
  Future<String> signup(String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!.uid;
    } catch (error) {
      if (error is FirebaseAuthException) {
        throw Exception(
          error.message,
        );
      } else {
        throw Exception('Failed to signup: $error');
      }
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      if (error is FirebaseAuthException) {
        throw Exception(
          error.message,
        );
      } else {
        throw Exception('Failed to logout: $error');
      }
    }
  }

  @override
  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to fetch user data: $error');
    }
  }

  @override
  Future<void> setUserData(String uid, dynamic payload) async {
    try {
      await _firestore.collection('users').doc(uid).set(payload);
    } catch (error) {
      throw Exception('Failed to set user data: $error');
    }
  }

  AuthUser? _firebaseUserToAuthUser(User? user) =>
      user != null ? AuthUser(uid: user.uid) : null;

  AuthUserCredential _firebaseUserCredentialToAuthUserCredential(
    UserCredential userCredential,
  ) =>
      AuthUserCredential(
        user: _firebaseUserToAuthUser(userCredential.user)!,
      );
}
