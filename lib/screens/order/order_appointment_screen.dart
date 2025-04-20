import 'package:flutter/material.dart';

class OrderAppointmentScreen extends StatelessWidget {
  const OrderAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sipariş & Randevu"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                // Yeni sipariş ekleme işlemi
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: const Text("Yeni Sipariş"),
                        content: const Text(
                          "Yeni sipariş ekleme ekranı burada açılır.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Kapat"),
                          ),
                        ],
                      ),
                );
              },
              child: const Text("Yeni Sipariş Oluştur"),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text("Randevu 1 - 22 Nisan 2025"),
              subtitle: const Text("10:00 - 10:30 • Ahmet Yılmaz"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Randevu detaylarına git
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text("Sipariş 2 - 23 Nisan 2025"),
              subtitle: const Text("Kahve siparişi - 2 adet Latte"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Sipariş detaylarına git
              },
            ),
          ],
        ),
      ),
    );
  }
}
