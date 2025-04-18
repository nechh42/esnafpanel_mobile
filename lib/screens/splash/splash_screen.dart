import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkSetupStatus();
    });
  }

  Future<void> _checkSetupStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }

    final doc =
        await FirebaseFirestore.instance
            .collection('businesses')
            .doc(user.uid)
            .get();

    final setupCompleted = doc.exists && doc.data()?['setupCompleted'] == true;

    if (setupCompleted) {
      Navigator.pushReplacementNamed(context, '/mainPanel');
    } else {
      Navigator.pushReplacementNamed(context, '/register_continue');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
