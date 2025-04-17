import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Dil Seçimi"),
            subtitle: const Text("Türkçe"),
            onTap: () {
              // Dil ayarı ekranına yönlendirme yapılabilir
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text("Tema"),
            subtitle: const Text("Sistem Varsayılanı"),
            onTap: () {
              // Tema değiştirme işlemi yapılabilir
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Destek"),
            subtitle: const Text("Bize ulaşın"),
            onTap: () {
              // Destek ekranına yönlendirme yapılabilir
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Sürüm"),
            subtitle: const Text("v1.0.0"),
          ),
        ],
      ),
    );
  }
}
