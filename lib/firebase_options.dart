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
    apiKey: 'AIzaSyAqLCeYnGSqsWVFmfkQ-LwkqIYtpJqP8mo',
    appId: '1:400865225365:web:4198e638717b286fce499c',
    messagingSenderId: '400865225365',
    projectId: 'procal-b9d20',
    authDomain: 'procal-b9d20.firebaseapp.com',
    storageBucket: 'procal-b9d20.firebasestorage.app',
    measurementId: 'G-YKZG967TVK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIdu4qjd9mCMUlkhbScMOWFIhlkqjU0xw',
    appId: '1:400865225365:android:8522d5373aa912c0ce499c',
    messagingSenderId: '400865225365',
    projectId: 'procal-b9d20',
    storageBucket: 'procal-b9d20.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUIqoH0n0FcTdMD09l8DzeSx5YbmVjAC8',
    appId: '1:400865225365:ios:8c797987a777d804ce499c',
    messagingSenderId: '400865225365',
    projectId: 'procal-b9d20',
    storageBucket: 'procal-b9d20.firebasestorage.app',
    iosClientId: '400865225365-i0p0cbogpma24vf6sicat80a4q5r7rom.apps.googleusercontent.com',
    iosBundleId: 'com.example.procal',
  );

}