// lib/screens/settings/settings_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';
import 'package:esnafpanel_mobile/screens/settings/profile_edit_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil Düzenle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileEditScreen(),
                ),
              );
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.brightness_6),
            title: const Text('Karanlık Tema'),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
