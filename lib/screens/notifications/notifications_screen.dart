import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, String>> dummyNotifications = const [
    {'title': 'Abonelik Başladı', 'body': '10 günlük demo süreniz başladı.'},
    {
      'title': 'Güncelleme',
      'body': 'Yeni özellikler eklendi. Ayarlar menüsünü kontrol edin.',
    },
    {'title': 'Bildirim', 'body': 'Veri yedekleme başarıyla tamamlandı.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bildirimler")),
      body: ListView.builder(
        itemCount: dummyNotifications.length,
        itemBuilder: (context, index) {
          final notification = dummyNotifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notification['title']!),
            subtitle: Text(notification['body']!),
          );
        },
      ),
    );
  }
}
