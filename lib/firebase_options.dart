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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBb2AUtefJVDZEwJFuzAPQVD54xZsnDrr8',
    appId: '1:554922277176:web:092b9f6af6d51fe45c29cd',
    messagingSenderId: '554922277176',
    projectId: 'sample-d7987',
    authDomain: 'sample-d7987.firebaseapp.com',
    databaseURL: 'https://sample-d7987-default-rtdb.firebaseio.com',
    storageBucket: 'sample-d7987.firebasestorage.app',
    measurementId: 'G-2ECS56S884',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvXnA0q7voWewQIX5Rd3_eNjzvWhJAzm0',
    appId: '1:554922277176:android:d8da6896e86e55a45c29cd',
    messagingSenderId: '554922277176',
    projectId: 'sample-d7987',
    databaseURL: 'https://sample-d7987-default-rtdb.firebaseio.com',
    storageBucket: 'sample-d7987.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvGmzQbk-qHURRj2kU04uhYSwZUMYxhZc',
    appId: '1:554922277176:ios:b683402dba10fc965c29cd',
    messagingSenderId: '554922277176',
    projectId: 'sample-d7987',
    databaseURL: 'https://sample-d7987-default-rtdb.firebaseio.com',
    storageBucket: 'sample-d7987.firebasestorage.app',
    androidClientId: '554922277176-fa8dn513plshmkecnnvuud1kgcbc315b.apps.googleusercontent.com',
    iosBundleId: 'com.example.nbaHighlights',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvGmzQbk-qHURRj2kU04uhYSwZUMYxhZc',
    appId: '1:554922277176:ios:b683402dba10fc965c29cd',
    messagingSenderId: '554922277176',
    projectId: 'sample-d7987',
    databaseURL: 'https://sample-d7987-default-rtdb.firebaseio.com',
    storageBucket: 'sample-d7987.firebasestorage.app',
    androidClientId: '554922277176-fa8dn513plshmkecnnvuud1kgcbc315b.apps.googleusercontent.com',
    iosBundleId: 'com.example.nbaHighlights',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBb2AUtefJVDZEwJFuzAPQVD54xZsnDrr8',
    appId: '1:554922277176:web:1014d0f7d2c710105c29cd',
    messagingSenderId: '554922277176',
    projectId: 'sample-d7987',
    authDomain: 'sample-d7987.firebaseapp.com',
    databaseURL: 'https://sample-d7987-default-rtdb.firebaseio.com',
    storageBucket: 'sample-d7987.firebasestorage.app',
    measurementId: 'G-PQNVVL8DSM',
  );
}
