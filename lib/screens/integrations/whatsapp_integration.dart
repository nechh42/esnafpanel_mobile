// lib/screens/integrations/whatsapp_integration.dart

import 'package:flutter/material.dart';

class WhatsappIntegrationScreen extends StatelessWidget {
  const WhatsappIntegrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WhatsApp Entegrasyonu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.message, size: 80, color: Colors.green),
            const SizedBox(height: 24),
            const Text(
              'WhatsApp bağlantısını kurmak için aşağıdaki adımları takip edin.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Bu kısımda WhatsApp API bağlantısı kurulabilir.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Henüz entegre edilmedi.')),
                );
              },
              icon: const Icon(Icons.link),
              label: const Text('Bağlantıyı Başlat'),
            ),
          ],
        ),
      ),
    );
  }
}
