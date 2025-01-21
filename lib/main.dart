import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully.");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(SkincareApp());
}

class SkincareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skincare Tracker',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: BottomNavBar(),
    );
  }
}
