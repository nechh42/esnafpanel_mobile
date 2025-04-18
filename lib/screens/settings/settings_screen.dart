import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';
import 'profile_edit_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Karanlık Mod'),
            value: themeProvider.isDarkMode,
            onChanged: (val) {
              themeProvider.toggleTheme();
            },
          ),
          ListTile(
            title: const Text('Profil Ayarları'),
            onTap: () {
              // Profil ekranına geçiş yapılabilir
            },
          ),
          ListTile(
            title: const Text('Şifre Değiştir'),
            onTap: () {
              Navigator.pushNamed(context, '/security');
            },
          ),
          ListTile(
            title: const Text('Bildirim Ayarları'),
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil Bilgilerini Düzenle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileEditScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
