import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/subscription_provider.dart';

class InstagramIntegrationScreen extends StatelessWidget {
  const InstagramIntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plan = Provider.of<SubscriptionProvider>(context).currentPlan;

    if (plan != 'pro') {
      return Scaffold(
        appBar: AppBar(title: const Text('Instagram Entegrasyonu')),
        body: const Center(
          child: Text('Bu özellik yalnızca Pro kullanıcılar için mevcuttur.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Instagram Entegrasyonu')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Instagram Bağlantısı',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Müşterilerinizle Instagram üzerinden bağlantı kurabilirsiniz. Profilinizi bağlamak için aşağıdaki butonu kullanın.',
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Instagram bağlanma işlemi başlatıldı...'),
                    ),
                  );
                },
                icon: const Icon(Icons.link),
                label: const Text("Instagram'a Bağlan"),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Not: Instagram entegrasyonu, müşteri geri bildirimlerini yönetmenizi kolaylaştırır.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
