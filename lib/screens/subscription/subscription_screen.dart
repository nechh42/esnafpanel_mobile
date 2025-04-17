import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String? selectedPlan;

  void _selectPlan(String plan) {
    setState(() {
      selectedPlan = plan;
    });
  }

  void _proceedToPayment() {
    if (selectedPlan == null) return;

    Navigator.pushNamed(context, '/payment', arguments: selectedPlan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Abonelik Planı Seç')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPlanTile('Demo', '10 gün ücretsiz deneme'),
            const SizedBox(height: 12),
            _buildPlanTile('Starter', '₺99,99 / ay - Temel özellikler'),
            const SizedBox(height: 12),
            _buildPlanTile('Pro', '₺249,99 / ay - Tüm özellikler'),
            const Spacer(),
            ElevatedButton(
              onPressed: _proceedToPayment,
              child: const Text('Devam Et'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanTile(String plan, String description) {
    final isSelected = selectedPlan == plan;
    return GestureDetector(
      onTap: () => _selectPlan(plan),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.white,
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text(description)),
            if (isSelected) const Icon(Icons.check, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
