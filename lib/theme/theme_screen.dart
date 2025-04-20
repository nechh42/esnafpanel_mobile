import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tema Ayarları")),
      body: const Center(child: Text("Tema ayarları burada gösterilecek.")),
    );
  }
}
