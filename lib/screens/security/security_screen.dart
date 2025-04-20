// lib/screens/security/security_screen.dart
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void _changePassword() {
    // Firebase Auth ile şifre değiştirme işlemi buraya eklenecek
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Şifre değiştirildi')));
  }

  void _deleteAccount() {
    // Firebase Auth ile hesap silme işlemi buraya eklenecek
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Hesap silindi')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Güvenlik')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mevcut Şifre'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Yeni Şifre'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              child: const Text('Şifreyi Değiştir'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: _deleteAccount,
              child: const Text('Hesabı Sil'),
            ),
          ],
        ),
      ),
    );
  }
}
