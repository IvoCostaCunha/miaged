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
    apiKey: 'AIzaSyDHdxKrn6eD2WbpVdYOG9E2ogwiX5Fg--M',
    appId: '1:310569550336:web:16be8824dc1bb191294ee5',
    messagingSenderId: '310569550336',
    projectId: 'miaged-db',
    authDomain: 'miaged-db.firebaseapp.com',
    storageBucket: 'miaged-db.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuUwUh7HOZBcP_p4h2Y1xz4pA0t1UPZEY',
    appId: '1:310569550336:android:a83029563c22f82b294ee5',
    messagingSenderId: '310569550336',
    projectId: 'miaged-db',
    storageBucket: 'miaged-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgzByc9HGLa9siBDE6dcull3ZwyGZQvmU',
    appId: '1:310569550336:ios:ac0a752517295e99294ee5',
    messagingSenderId: '310569550336',
    projectId: 'miaged-db',
    storageBucket: 'miaged-db.appspot.com',
    iosClientId: '310569550336-ptjikrunu944pk1cb8eklkk68esgile4.apps.googleusercontent.com',
    iosBundleId: 'com.example.miaged',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgzByc9HGLa9siBDE6dcull3ZwyGZQvmU',
    appId: '1:310569550336:ios:ac0a752517295e99294ee5',
    messagingSenderId: '310569550336',
    projectId: 'miaged-db',
    storageBucket: 'miaged-db.appspot.com',
    iosClientId: '310569550336-ptjikrunu944pk1cb8eklkk68esgile4.apps.googleusercontent.com',
    iosBundleId: 'com.example.miaged',
  );
}
