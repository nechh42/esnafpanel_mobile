// lib/screens/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/screens/settings/profile_edit_screen.dart';
import 'package:esnafpanel_mobile/theme/theme_screen.dart';
import 'package:esnafpanel_mobile/screens/security/security_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Profil Düzenle'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileEditScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Tema Ayarları'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ThemeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Güvenlik'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SecurityScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
