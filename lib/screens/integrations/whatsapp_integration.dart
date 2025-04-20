// lib/screens/integrations/whatsapp_integration.dart

import 'package:flutter/material.dart';

class WhatsAppIntegrationScreen extends StatelessWidget {
  const WhatsAppIntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WhatsApp Entegrasyonu")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "WhatsApp Entegrasyonu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Müşterilerinizle doğrudan WhatsApp üzerinden iletişime geçin. Bu ekran üzerinden numara bağlantısı ve otomatik mesaj sistemlerini yönetebilirsiniz.",
            ),
            SizedBox(height: 20),
            Text(
              "🔒 Bu özellik sadece Starter ve Pro paketlerde aktiftir.",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
