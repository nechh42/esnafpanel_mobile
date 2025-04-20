import 'package:flutter/material.dart';

class WhatsappIntegrationScreen extends StatelessWidget {
  const WhatsappIntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WhatsApp Entegrasyonu')),
      body: const Center(
        child: Text('WhatsApp ile entegrasyon buradan yapılacak.'),
      ),
    );
  }
}
