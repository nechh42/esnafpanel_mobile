import 'package:flutter/material.dart';

class AboneKontrolScreen extends StatelessWidget {
  const AboneKontrolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Abonelik Kontrol')),
      body: const Center(
        child: Text('Demo süresi ve abonelik durumu bu ekranda görünecek.'),
      ),
    );
  }
}
