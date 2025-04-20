import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esnafpanel_mobile/services/auth_service.dart';
import 'package:esnafpanel_mobile/screens/auth/login_screen.dart';
import 'package:esnafpanel_mobile/screens/auth/register_continue_screen.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    await Future.delayed(const Duration(seconds: 2)); // Logo gösterimi için

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      bool isSetupDone = await _authService.isSetupCompleted(user.uid);

      if (isSetupDone) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainPanelScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const RegisterContinueScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 100)));
  }
}
