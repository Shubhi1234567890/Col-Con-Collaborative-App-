import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // <--- ADD THIS LINE: Import the generated Firebase options
import 'entry_page.dart'; // Ensure this path is correct
import 'signup_page.dart'; // Import your signup widget
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  // <--- MODIFY THIS LINE: Initialize Firebase with current platform options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collab App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', // Ensure 'Montserrat' is properly configured in pubspec.yaml if it's a custom font.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignedupWidget(), // Corrected: Changed SignedupWidget to SignupWidget
    );
  }
}