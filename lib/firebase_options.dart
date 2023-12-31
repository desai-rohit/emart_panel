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
    apiKey: 'AIzaSyB7cCWkB-DDKmLIWTH8ur_02dpyEjbeoLA',
    appId: '1:519989135470:web:820ba0178adc85ba657e7f',
    messagingSenderId: '519989135470',
    projectId: 'ecommerce-4c31c',
    authDomain: 'ecommerce-4c31c.firebaseapp.com',
    databaseURL: 'https://ecommerce-4c31c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecommerce-4c31c.appspot.com',
    measurementId: 'G-87G5N4DEWE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx7s7GLXtRZ3EHaOEPjLEoX7O97wQyihw',
    appId: '1:519989135470:android:81321f55cb601280657e7f',
    messagingSenderId: '519989135470',
    projectId: 'ecommerce-4c31c',
    databaseURL: 'https://ecommerce-4c31c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecommerce-4c31c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC110jmonl4pMqr8BzESNfQ4erSe8sIvwI',
    appId: '1:519989135470:ios:00e65abfabd09014657e7f',
    messagingSenderId: '519989135470',
    projectId: 'ecommerce-4c31c',
    databaseURL: 'https://ecommerce-4c31c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecommerce-4c31c.appspot.com',
    androidClientId: '519989135470-eh7mehjsdep2gcusub46pjtqncfimd21.apps.googleusercontent.com',
    iosClientId: '519989135470-ftj0r2lbpvtjufvme0a9tumuqepag1hf.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerseSellerDevApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC110jmonl4pMqr8BzESNfQ4erSe8sIvwI',
    appId: '1:519989135470:ios:1ecf90ac64aaedf9657e7f',
    messagingSenderId: '519989135470',
    projectId: 'ecommerce-4c31c',
    databaseURL: 'https://ecommerce-4c31c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecommerce-4c31c.appspot.com',
    androidClientId: '519989135470-eh7mehjsdep2gcusub46pjtqncfimd21.apps.googleusercontent.com',
    iosClientId: '519989135470-dpmmf5jfjp81evd245hc75nlg4fkdabv.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerseSellerDevApp.RunnerTests',
  );
}
