import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Örnek sabit bildirim listesi (dilersen Firestore ile entegre edebilirsin)
    final List<String> notifications = [
      "Yeni müşteri kaydı yapıldı.",
      "Bugün 3 adet randevu var.",
      "Yedekleme başarıyla tamamlandı.",
      "Ödeme başarıyla alındı.",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Bildirimler")),
      body:
          notifications.isEmpty
              ? const Center(child: Text("Henüz bir bildirim yok."))
              : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.notifications_active),
                      title: Text(notifications[index]),
                    ),
                  );
                },
              ),
    );
  }
}
