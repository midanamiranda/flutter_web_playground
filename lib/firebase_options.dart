// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAGwOmmWcg48XL0YvmZHlp8t9e3RCgRGyo',
    appId: '1:588243416253:web:0b0a194f0e8f79260a33d4',
    messagingSenderId: '588243416253',
    projectId: 'flutterfireapp-android',
    authDomain: 'flutterfireapp-android.firebaseapp.com',
    storageBucket: 'flutterfireapp-android.appspot.com',
    measurementId: 'G-MKSFJYGBT7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDszUD5pz5rkeAnkMAFZrpein6Nb3k4D8A',
    appId: '1:588243416253:android:afd8a7e1efca455c0a33d4',
    messagingSenderId: '588243416253',
    projectId: 'flutterfireapp-android',
    storageBucket: 'flutterfireapp-android.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuvOTw3sS8q6vlYPPklR4_IsUcwIc8HtM',
    appId: '1:588243416253:ios:e34a075c0ef6621f0a33d4',
    messagingSenderId: '588243416253',
    projectId: 'flutterfireapp-android',
    storageBucket: 'flutterfireapp-android.appspot.com',
    iosClientId: '588243416253-qikl4l2ao694ia2db7ovimsku2f9hg4s.apps.googleusercontent.com',
    iosBundleId: 'be.brave.apps.dashcourse',
  );
}
