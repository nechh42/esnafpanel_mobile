import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/screens/business/business_selection_screen.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Kullanıcı giriş yapmamış
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }

    final userDoc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

    if (userDoc.exists && userDoc.data()!.containsKey('businessId')) {
      final businessId = userDoc['businessId'];
      if (businessId != null && businessId.toString().isNotEmpty) {
        // Kullanıcının işletme kaydı var
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainPanelScreen()),
        );
        return;
      }
    }

    // Kullanıcının işletme kaydı yok
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BusinessSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
