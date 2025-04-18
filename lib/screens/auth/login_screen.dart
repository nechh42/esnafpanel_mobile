import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';
import 'package:esnafpanel_mobile/screens/auth/register_continue_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  Future<void> _signIn() async {
    setState(() => _isLoading = true);

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPanelScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Giriş başarısız. Lütfen bilgileri kontrol edin.";

      if (e.code == 'user-not-found') {
        errorMessage = "Bu e-posta ile kayıtlı kullanıcı bulunamadı.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Hatalı şifre girdiniz.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "E-posta"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Şifre"),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _signIn,
                  child: const Text("Giriş Yap"),
                ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RegisterContinueScreen(),
                  ),
                );
              },
              child: const Text("Hesabın yok mu? Kayıt ol"),
            ),
          ],
        ),
      ),
    );
  }
}
