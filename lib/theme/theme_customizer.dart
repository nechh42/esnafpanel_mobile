import 'package:flutter/material.dart';

class ThemeCustomizer extends StatelessWidget {
  const ThemeCustomizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tema Seçimi')),
      body: Center(child: Text('Tema ayarları burada yapılacak.')),
    );
  }
}