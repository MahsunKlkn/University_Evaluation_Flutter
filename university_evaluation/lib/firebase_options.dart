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
    apiKey: 'AIzaSyDR-m-30gsoomyEe1eagkz6TCnPzPMrJmQ',
    appId: '1:190487484422:web:cfe704be98ccef3b108b87',
    messagingSenderId: '190487484422',
    projectId: 'university-review-62efa',
    authDomain: 'university-review-62efa.firebaseapp.com',
    storageBucket: 'university-review-62efa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHcGrnhtAT29ppAurzAQTQP0bEgVnZwrM',
    appId: '1:190487484422:android:295e4fc38f7fa0a1108b87',
    messagingSenderId: '190487484422',
    projectId: 'university-review-62efa',
    storageBucket: 'university-review-62efa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDI_EmCHtyCsomOaAKX5p-gHVDL9IXbIEI',
    appId: '1:190487484422:ios:7ec99c15a7eb7e70108b87',
    messagingSenderId: '190487484422',
    projectId: 'university-review-62efa',
    storageBucket: 'university-review-62efa.appspot.com',
    iosBundleId: 'com.example.futureEducationAnalysis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDI_EmCHtyCsomOaAKX5p-gHVDL9IXbIEI',
    appId: '1:190487484422:ios:d0d43f3d6529c3aa108b87',
    messagingSenderId: '190487484422',
    projectId: 'university-review-62efa',
    storageBucket: 'university-review-62efa.appspot.com',
    iosBundleId: 'com.example.futureEducationAnalysis.RunnerTests',
  );
}
