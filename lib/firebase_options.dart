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
    apiKey: 'AIzaSyCj3iuETBTlLIaDyLDMckzPtPIvLR-ME3g',
    appId: '1:627866622342:web:fe22bf3ca6ca13be673407',
    messagingSenderId: '627866622342',
    projectId: 'interceptor-assignment-2849e',
    authDomain: 'interceptor-assignment-2849e.firebaseapp.com',
    storageBucket: 'interceptor-assignment-2849e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt7LupTMvVq7BzPvSClYlHGvWhHkeKMQ8',
    appId: '1:627866622342:android:1fb12516a043ec19673407',
    messagingSenderId: '627866622342',
    projectId: 'interceptor-assignment-2849e',
    storageBucket: 'interceptor-assignment-2849e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpou0n3TqMWeUpmXWjj0EmTFtLNIrxUHs',
    appId: '1:627866622342:ios:d2cc1c023b58a74e673407',
    messagingSenderId: '627866622342',
    projectId: 'interceptor-assignment-2849e',
    storageBucket: 'interceptor-assignment-2849e.appspot.com',
    iosBundleId: 'com.example.flutterAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpou0n3TqMWeUpmXWjj0EmTFtLNIrxUHs',
    appId: '1:627866622342:ios:38b002e6ab0d3ad7673407',
    messagingSenderId: '627866622342',
    projectId: 'interceptor-assignment-2849e',
    storageBucket: 'interceptor-assignment-2849e.appspot.com',
    iosBundleId: 'com.example.flutterAuth.RunnerTests',
  );
}
