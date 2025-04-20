// lib/theme/theme_customizer.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCustomizerScreen extends StatefulWidget {
  const ThemeCustomizerScreen({Key? key}) : super(key: key);

  @override
  State<ThemeCustomizerScreen> createState() => _ThemeCustomizerScreenState();
}

class _ThemeCustomizerScreenState extends State<ThemeCustomizerScreen> {
  Color _selectedColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _loadThemeColor();
  }

  Future<void> _loadThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('themeColor') ?? Colors.blue.value;
    setState(() {
      _selectedColor = Color(colorValue);
    });
  }

  Future<void> _saveThemeColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeColor', color.value);
  }

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
    _saveThemeColor(color);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Tema rengi güncellendi: ${color.toString()}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.red,
      Colors.teal,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tema Özelleştirici"),
        backgroundColor: _selectedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Bir tema rengi seçin:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children:
                  colors.map((color) {
                    return GestureDetector(
                      onTap: () => _changeColor(color),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 24,
                        child:
                            _selectedColor == color
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
