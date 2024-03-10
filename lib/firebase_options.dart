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
    apiKey: 'AIzaSyClCqUKeZHK8BwQydJy9IetdgHB66r6rIA',
    appId: '1:219353208268:web:f53bcac63994c84d9c7969',
    messagingSenderId: '219353208268',
    projectId: 'news-app-9025c',
    authDomain: 'news-app-9025c.firebaseapp.com',
    storageBucket: 'news-app-9025c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMmQINA9Vihy05tAIs87CYAL4jwAipvNo',
    appId: '1:219353208268:android:5776c3efb19b83b89c7969',
    messagingSenderId: '219353208268',
    projectId: 'news-app-9025c',
    storageBucket: 'news-app-9025c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiN3ph4CbA5OVP-H0g4__RLPR2cHsAaOw',
    appId: '1:219353208268:ios:544ae7a1632afaee9c7969',
    messagingSenderId: '219353208268',
    projectId: 'news-app-9025c',
    storageBucket: 'news-app-9025c.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiN3ph4CbA5OVP-H0g4__RLPR2cHsAaOw',
    appId: '1:219353208268:ios:293d06cfb931a14a9c7969',
    messagingSenderId: '219353208268',
    projectId: 'news-app-9025c',
    storageBucket: 'news-app-9025c.appspot.com',
    iosBundleId: 'com.example.newsApp.RunnerTests',
  );
}