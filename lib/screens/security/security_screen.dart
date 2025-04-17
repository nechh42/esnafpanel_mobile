import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _biometricEnabled = false;
  bool _twoFactorAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Güvenlik Ayarları'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Biyometrik Giriş'),
              subtitle: const Text('Parmak izi veya yüz tanıma ile giriş yap'),
              value: _biometricEnabled,
              onChanged: (bool value) {
                setState(() {
                  _biometricEnabled = value;
                });
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('İki Aşamalı Doğrulama'),
              subtitle: const Text('Girişlerde ekstra güvenlik kodu iste'),
              value: _twoFactorAuth,
              onChanged: (bool value) {
                setState(() {
                  _twoFactorAuth = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
