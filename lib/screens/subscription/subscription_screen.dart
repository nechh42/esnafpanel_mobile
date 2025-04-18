import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedPlan = 'demo';

  void _continueToPayment() {
    if (selectedPlan == 'demo') {
      Navigator.pushReplacementNamed(context, '/main_panel');
    } else {
      Navigator.pushNamed(context, '/payment');
    }
  }

  Widget _buildPlanTile(String title, String description, String planKey) {
    final isSelected = selectedPlan == planKey;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = planKey;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.shade100 : Colors.grey.shade200,
          border: Border.all(color: isSelected ? Colors.teal : Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(description),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Abonelik Seçimi")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildPlanTile(
              "Demo (10 Gün)",
              "Sınırlı kullanım - ücretsiz",
              "demo",
            ),
            _buildPlanTile(
              "Starter",
              "₺99,99/ay - Temel özellikler",
              "starter",
            ),
            _buildPlanTile(
              "Pro",
              "₺249,99/ay - Tüm özellikler + destek",
              "pro",
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _continueToPayment,
              child: const Text("Devam Et"),
            ),
          ],
        ),
      ),
    );
  }
}
