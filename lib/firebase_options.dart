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
    apiKey: 'AIzaSyCXFh9lCu7EeAz8DWleoWXnMdyDtK9f0Nk',
    appId: '1:357517433015:web:815fefe46e5e12e2ea5532',
    messagingSenderId: '357517433015',
    projectId: 'denemedeneme-beef0',
    authDomain: 'denemedeneme-beef0.firebaseapp.com',
    storageBucket: 'denemedeneme-beef0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnvAKASmStoh0BIWhIQmif2Jqq4N4bTL0',
    appId: '1:357517433015:android:7a5ad3f993d3f658ea5532',
    messagingSenderId: '357517433015',
    projectId: 'denemedeneme-beef0',
    storageBucket: 'denemedeneme-beef0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwXgnkZxvpKAbV1kpHfrLLe-KcRJaIFgI',
    appId: '1:357517433015:ios:ae97f65357bcc4f2ea5532',
    messagingSenderId: '357517433015',
    projectId: 'denemedeneme-beef0',
    storageBucket: 'denemedeneme-beef0.appspot.com',
    iosClientId: '357517433015-pv4q1fnfsiohv2vje0480k4034d1cqie.apps.googleusercontent.com',
    iosBundleId: 'com.example.denemedeneme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwXgnkZxvpKAbV1kpHfrLLe-KcRJaIFgI',
    appId: '1:357517433015:ios:3a389ddd70d6275bea5532',
    messagingSenderId: '357517433015',
    projectId: 'denemedeneme-beef0',
    storageBucket: 'denemedeneme-beef0.appspot.com',
    iosClientId: '357517433015-tcq171v1h6esqtiatebe7ta78kj69ph5.apps.googleusercontent.com',
    iosBundleId: 'com.example.denemedeneme.RunnerTests',
  );
}
