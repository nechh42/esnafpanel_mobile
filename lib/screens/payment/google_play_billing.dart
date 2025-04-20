// lib/screens/payment/google_play_billing.dart

import 'package:flutter/material.dart';

class GooglePlayBillingScreen extends StatelessWidget {
  const GooglePlayBillingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Geçici UI, Google Play Billing entegrasyonu eklenecek
    return Scaffold(
      appBar: AppBar(title: const Text("Google Play Ödemeleri")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Abonelik Planınızı Yönetin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Google Play Billing entegrasyonu yapılacak
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Google Play bağlantısı yakında aktif olacak.",
                    ),
                  ),
                );
              },
              child: const Text("Abonelik Satın Al"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Abonelik durumunu kontrol et
              },
              child: const Text("Abonelik Durumunu Kontrol Et"),
            ),
          ],
        ),
      ),
    );
  }
}
