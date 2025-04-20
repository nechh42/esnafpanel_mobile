import 'package:flutter/material.dart';

class AboneKontrolScreen extends StatelessWidget {
  const AboneKontrolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Abonelik Kontrolü")),
      body: const Center(
        child: Text("Abonelik durumu burada kontrol edilecek."),
      ),
    );
  }
}
