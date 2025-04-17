import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String selectedPlan;

  const PaymentScreen({super.key, required this.selectedPlan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ödeme')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seçilen Plan: $selectedPlan',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Ödeme yöntemi: Sadece kredi kartı (simülasyon)',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Normalde burada ödeme işlemi yapılır
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ödeme başarılı!')),
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/main',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.credit_card),
                label: const Text('Ödemeyi Tamamla'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
