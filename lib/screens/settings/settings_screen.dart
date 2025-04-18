import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/screens/theme/theme_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil Düzenle"),
            onTap: () {
              // Profil düzenleme ekranına yönlendirme yapılacak (sonraki adım)
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text("Tema Ayarları"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Şifre Değiştir"),
            onTap: () {
              // Şifre değiştirme ekranına yönlendirme yapılacak (sonraki adım)
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text("Güvenlik"),
            trailing: const Icon(Icons.arrow_forward_ios),
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
