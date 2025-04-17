import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bildirimler'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Yeni müşteri kaydı yapıldı'),
            subtitle: Text('2 dakika önce'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('WhatsApp mesajı gönderildi'),
            subtitle: Text('10 dakika önce'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Veri yedeklemesi tamamlandı'),
            subtitle: Text('Bugün 09:30'),
          ),
        ],
      ),
    );
  }
}
