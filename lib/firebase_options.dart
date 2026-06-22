import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// This was created with standard placeholder credentials.
/// Replace them with your own Firebase project's credentials by running
/// `flutterfire configure` or modifying this file directly.
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-mock-api-key-value',
    appId: '1:1234567890:web:1234567890abcdef',
    messagingSenderId: '1234567890',
    projectId: 'electronic-store-app',
    authDomain: 'electronic-store-app.firebaseapp.com',
    storageBucket: 'electronic-store-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-mock-api-key-value',
    appId: '1:1234567890:android:1234567890abcdef',
    messagingSenderId: '1234567890',
    projectId: 'electronic-store-app',
    storageBucket: 'electronic-store-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-mock-api-key-value',
    appId: '1:1234567890:ios:1234567890abcdef',
    messagingSenderId: '1234567890',
    projectId: 'electronic-store-app',
    storageBucket: 'electronic-store-app.appspot.com',
    iosBundleId: 'com.example.electronicStore',
  );
}
