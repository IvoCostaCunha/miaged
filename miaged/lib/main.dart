import 'package:flutter/material.dart';
import 'views/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDHdxKrn6eD2WbpVdYOG9E2ogwiX5Fg--M",
    appId: "1:310569550336:web:16be8824dc1bb191294ee5",
    messagingSenderId: "310569550336",
    projectId: "miaged-db",
  )); // initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Miagged',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
