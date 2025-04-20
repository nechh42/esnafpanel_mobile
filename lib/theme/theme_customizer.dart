import 'package:flutter/material.dart';

class ThemeCustomizerScreen extends StatelessWidget {
  const ThemeCustomizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tema Özelleştir')),
      body: const Center(
        child: Text('Pro kullanıcılar için renk düzeni ve özelleştirme.'),
      ),
    );
  }
}
