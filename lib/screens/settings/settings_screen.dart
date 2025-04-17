import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar'), centerTitle: true),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profil Bilgileri'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Gizlilik ve Güvenlik'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Tema Ayarları'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Çıkış Yap'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
