import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Logo animasyonu vs için

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushReplacementNamed(context, '/login');
        return;
      }

      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      final setupCompleted = doc.data()?['setupCompleted'] ?? false;

      if (setupCompleted) {
        Navigator.pushReplacementNamed(context, '/main_panel');
      } else {
        Navigator.pushReplacementNamed(context, '/register_continue');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: FlutterLogo(size: 80)),
    );
  }
}
