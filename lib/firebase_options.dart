// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApknKbv72Sls9nm8LbJwu1k-piGm7jyuw',
    appId: '1:228274356854:web:a5bc374be99177ed1f5557',
    messagingSenderId: '228274356854',
    projectId: 'daily-hogwarts-7c419',
    authDomain: 'daily-hogwarts-7c419.firebaseapp.com',
    storageBucket: 'daily-hogwarts-7c419.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4BvYuoudFtLsFzWbHk2nieZlFauqMdqM',
    appId: '1:228274356854:android:e1423ee6297c22691f5557',
    messagingSenderId: '228274356854',
    projectId: 'daily-hogwarts-7c419',
    storageBucket: 'daily-hogwarts-7c419.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeq3aE2BQrug7ZblZfEVFTMxdMch-_pwk',
    appId: '1:228274356854:ios:261f3386b0638e611f5557',
    messagingSenderId: '228274356854',
    projectId: 'daily-hogwarts-7c419',
    storageBucket: 'daily-hogwarts-7c419.appspot.com',
    iosBundleId: 'com.example.dailyHogwarts',
  );
}
