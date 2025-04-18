import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/firebase/firebase_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _signIn() async {
    final authService = FirebaseAuthService();

    final userCredential = await authService.signInWithEmail(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (userCredential != null) {
      print("✅ Giriş başarılı: ${userCredential.user?.email}");
      Navigator.pushReplacementNamed(context, '/main_panel');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Giriş başarısız! Lütfen bilgileri kontrol edin.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Giriş Yap", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Şifre"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _signIn, child: const Text("Giriş")),
          ],
        ),
      ),
    );
  }
}
