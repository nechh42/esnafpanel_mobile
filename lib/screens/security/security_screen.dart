import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  void _changePassword(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email != null) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Güvenlik")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock_reset),
            title: const Text("Şifreyi Değiştir"),
            onTap: () => _changePassword(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Çıkış Yap"),
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }
}
