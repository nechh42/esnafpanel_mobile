import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterContinueScreen extends StatefulWidget {
  const RegisterContinueScreen({Key? key}) : super(key: key);

  @override
  State<RegisterContinueScreen> createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  Future<void> _signUp() async {
    setState(() => _isLoading = true);

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Kayıt başarılı!')));

      Navigator.pushReplacementNamed(context, '/subscription');
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Kayıt başarısız.";
      if (e.code == 'email-already-in-use') {
        errorMessage = "Bu e-posta zaten kayıtlı.";
      } else if (e.code == 'weak-password') {
        errorMessage = "Şifre çok zayıf.";
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
      appBar: AppBar(title: const Text("Kayıt Ol")),
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
                  onPressed: _signUp,
                  child: const Text("Kayıt Ol"),
                ),
          ],
        ),
      ),
    );
  }
}
