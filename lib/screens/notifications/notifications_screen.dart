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
          NotificationTile(
            title: "Yeni Sipariş",
            message: "Yeni bir sipariş alındı.",
            time: "5 dk önce",
          ),
          NotificationTile(
            title: "Ödeme Başarılı",
            message: "Abonelik ödemeniz alındı.",
            time: "1 saat önce",
          ),
          NotificationTile(
            title: "Sistem Güncellemesi",
            message: "Uygulamada yeni özellikler eklendi.",
            time: "Dün",
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        trailing: Text(time, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
