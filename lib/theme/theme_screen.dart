import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Tema Ayarları')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('Açık Tema'),
              value: ThemeMode.light,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setTheme(value);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Koyu Tema'),
              value: ThemeMode.dark,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setTheme(value);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Sistem Varsayılanı'),
              value: ThemeMode.system,
              groupValue: currentTheme,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setTheme(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
