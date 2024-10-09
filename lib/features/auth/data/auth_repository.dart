import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_hogwarts/core/data/auth_payload.dart';
import 'package:daily_hogwarts/core/data/user_model.dart';
import 'package:daily_hogwarts/core/utils/enums/houses.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      if (error is FirebaseAuthException) {
        throw Exception(
          error.message,
        );
      } else {
        throw Exception(error);
      }
    }
  }

  Future<String> signup(String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!.uid;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception('Failed to logout: $error');
    }
  }

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

  Future<void> setUserData(String uid, AuthPayload payload) async {
    House house = _getRandomHouse();
    try {
      await _firestore.collection('users').doc(uid).set({
        'id': uid,
        'username': payload.username,
        'email': payload.email,
        'house': house.name,
      });
    } catch (error) {
      throw Exception('Failed to set user data: $error');
    }
  }

  House _getRandomHouse() {
    const houses = House.values;
    return houses[Random().nextInt(houses.length)];
  }
}
