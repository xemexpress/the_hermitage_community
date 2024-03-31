// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyACl7hpAZiUYvOE4NGE1taZlR64AGAsmV0',
    appId: '1:822147206443:web:a922b04a54efab0fd2096e',
    messagingSenderId: '822147206443',
    projectId: 'the-hermitage-community',
    authDomain: 'the-hermitage-community.firebaseapp.com',
    storageBucket: 'the-hermitage-community.appspot.com',
    measurementId: 'G-JCS5P9SKJT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBu2_1wEO-fINpZUL1nUSqTYIe7x3K37ks',
    appId: '1:822147206443:android:d30286d5b30c9ff6d2096e',
    messagingSenderId: '822147206443',
    projectId: 'the-hermitage-community',
    storageBucket: 'the-hermitage-community.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDw_01v4BObZ0dCsTvAN4wUgSgBSYV1C8M',
    appId: '1:822147206443:ios:2b9a2dc6b19f5715d2096e',
    messagingSenderId: '822147206443',
    projectId: 'the-hermitage-community',
    storageBucket: 'the-hermitage-community.appspot.com',
    iosBundleId: 'com.example.theHermitageCommunity',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDw_01v4BObZ0dCsTvAN4wUgSgBSYV1C8M',
    appId: '1:822147206443:ios:e80925e4af8d73e9d2096e',
    messagingSenderId: '822147206443',
    projectId: 'the-hermitage-community',
    storageBucket: 'the-hermitage-community.appspot.com',
    iosBundleId: 'com.example.theHermitageCommunity.RunnerTests',
  );
}
