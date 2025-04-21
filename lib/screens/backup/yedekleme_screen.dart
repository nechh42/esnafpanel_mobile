import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/services/yedekleme_service.dart';

class YedeklemeScreen extends StatelessWidget {
  const YedeklemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yedekleme İşlemleri"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verilerinizi korumak için düzenli olarak yedek alabilirsiniz.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                YedeklemeService.yedekAl();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Yedek alındı")));
              },
              icon: const Icon(Icons.backup),
              label: const Text("Yedek Al"),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                YedeklemeService.yedektenYukle();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Yedek geri yüklendi")),
                );
              },
              icon: const Icon(Icons.restore),
              label: const Text("Yedekten Yükle"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
