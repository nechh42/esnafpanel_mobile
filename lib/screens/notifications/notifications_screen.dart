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
          NotificationCard(
            title: 'Yeni Özellik!',
            message:
                'Artık siparişleri WhatsApp üzerinden takip edebilirsiniz.',
            date: '18 Nisan 2025',
          ),
          NotificationCard(
            title: 'Bakım Zamanı',
            message:
                'Sunucularımız bu gece 00:00-02:00 arasında bakımda olacak.',
            date: '17 Nisan 2025',
          ),
          NotificationCard(
            title: 'Pro Paket Avantajı',
            message:
                'Instagram entegrasyonu şimdi aktif! Pro kullanıcılar için geçerli.',
            date: '16 Nisan 2025',
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String date;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(message),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
