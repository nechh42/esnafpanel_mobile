import 'package:flutter/material.dart';
import '../../services/yedekleme_service.dart';

class YedeklemeScreen extends StatelessWidget {
  const YedeklemeScreen({Key? key}) : super(key: key);

  void _yedekAl(BuildContext context) async {
    final success = await YedeklemeService().yedekAl();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? 'Yedek başarıyla alındı!' : 'Yedek alınamadı.'),
      ),
    );
  }

  void _yedekYukle(BuildContext context) async {
    final success = await YedeklemeService().yedekYukle();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? 'Yedek başarıyla yüklendi!' : 'Yedek yüklenemedi.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yedekleme')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Verilerinizi güvenle yedekleyin ve gerektiğinde geri yükleyin.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => _yedekAl(context),
              icon: const Icon(Icons.backup),
              label: const Text('Yedek Al'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _yedekYukle(context),
              icon: const Icon(Icons.restore),
              label: const Text('Yedeği Geri Yükle'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
