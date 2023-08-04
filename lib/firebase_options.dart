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
    apiKey: 'AIzaSyAHPWAtXeBfAARvg4lXlt7VUP3FqMkf9Ng',
    appId: '1:108755459227:web:b8dad7b356b466496cfa3e',
    messagingSenderId: '108755459227',
    projectId: 'shani-todo-flutter-app',
    authDomain: 'shani-todo-flutter-app.firebaseapp.com',
    storageBucket: 'shani-todo-flutter-app.appspot.com',
    measurementId: 'G-FL28XM0REV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9-rG7ha8Pyu_gPmg-84KUFZ-qXNGDTr4',
    appId: '1:108755459227:android:10c11b9f054a1c186cfa3e',
    messagingSenderId: '108755459227',
    projectId: 'shani-todo-flutter-app',
    storageBucket: 'shani-todo-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwZ2wMVJUcq0PO-wu97An77bhwkBrBkfo',
    appId: '1:108755459227:ios:3690983fcec693ba6cfa3e',
    messagingSenderId: '108755459227',
    projectId: 'shani-todo-flutter-app',
    storageBucket: 'shani-todo-flutter-app.appspot.com',
    iosClientId: '108755459227-kv3ffi68a88j06vd16daeu832vbmc5t5.apps.googleusercontent.com',
    iosBundleId: 'com.example.advancedFlutterTodoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwZ2wMVJUcq0PO-wu97An77bhwkBrBkfo',
    appId: '1:108755459227:ios:134ab425629931246cfa3e',
    messagingSenderId: '108755459227',
    projectId: 'shani-todo-flutter-app',
    storageBucket: 'shani-todo-flutter-app.appspot.com',
    iosClientId: '108755459227-2k7gfmf15dps423gi359dul21ca3jpnc.apps.googleusercontent.com',
    iosBundleId: 'com.example.advancedFlutterTodoApp.RunnerTests',
  );
}
