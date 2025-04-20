// lib/screens/theme/theme_customizer.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';

class ThemeCustomizerScreen extends StatelessWidget {
  const ThemeCustomizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeMode currentTheme = themeProvider.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Tema Özelleştirme')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tema Modu Seçimi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            RadioListTile<ThemeMode>(
              title: const Text('Açık Tema'),
              value: ThemeMode.light,
              groupValue: currentTheme,
              onChanged: (value) => themeProvider.setTheme(value!),
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Koyu Tema'),
              value: ThemeMode.dark,
              groupValue: currentTheme,
              onChanged: (value) => themeProvider.setTheme(value!),
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Sistem Teması'),
              value: ThemeMode.system,
              groupValue: currentTheme,
              onChanged: (value) => themeProvider.setTheme(value!),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Bu ekran sadece Pro kullanıcılar içindir.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
