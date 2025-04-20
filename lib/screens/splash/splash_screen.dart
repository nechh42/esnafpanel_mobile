import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnafpanel_mobile/services/abone_kontrol_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _kontrolEtVeYonlendir();
  }

  Future<void> _kontrolEtVeYonlendir() async {
    final user = _auth.currentUser;

    // Eğer kullanıcı giriş yapmamışsa login ekranına yönlendir
    if (user == null) {
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }

    // Kullanıcı giriş yaptıysa Firestore’dan bilgileri al
    final userDoc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

    if (!userDoc.exists || userDoc.data() == null) {
      Navigator.pushReplacementNamed(context, '/register_continue');
      return;
    }

    final bool setupCompleted = userDoc.data()?['setupCompleted'] ?? false;

    // Eğer kurulum tamamlanmamışsa devam ekranına yönlendir
    if (!setupCompleted) {
      Navigator.pushReplacementNamed(context, '/register_continue');
      return;
    }

    // Şimdi abonelik süresine bakalım
    final aboneServisi = AboneKontrolService();
    final aboneGecerli = await aboneServisi.isAbonelikGecerli();

    if (aboneGecerli) {
      Navigator.pushReplacementNamed(context, '/main_panel');
    } else {
      Navigator.pushReplacementNamed(context, '/subscription');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
