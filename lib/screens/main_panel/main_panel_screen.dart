import 'package:flutter/material.dart';

class MainPanelScreen extends StatelessWidget {
  const MainPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ana Panel'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.dashboard, size: 80),
            SizedBox(height: 20),
            Text(
              'Hoş geldiniz!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Burası uygulamanın ana panel ekranı.'),
          ],
        ),
      ),
    );
  }
}
