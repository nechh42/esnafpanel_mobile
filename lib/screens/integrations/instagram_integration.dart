import 'package:flutter/material.dart';

class InstagramIntegrationScreen extends StatelessWidget {
  const InstagramIntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram Entegrasyonu')),
      body: const Center(
        child: Text('Instagram bağlantısı buradan yapılabilir.'),
      ),
    );
  }
}
