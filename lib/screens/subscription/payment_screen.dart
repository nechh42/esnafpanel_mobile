import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  bool isProcessing = false;

  void _processPayment() async {
    setState(() => isProcessing = true);

    // Burada gerçek ödeme entegrasyonu yapılabilir
    await Future.delayed(const Duration(seconds: 2));

    setState(() => isProcessing = false);
    Navigator.pushReplacementNamed(context, '/main_panel');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ödeme")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(labelText: "Kart Numarası"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _expiryController,
              decoration: const InputDecoration(
                labelText: "Son Kullanma (AA/YY)",
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _cvvController,
              decoration: const InputDecoration(labelText: "CVV"),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            isProcessing
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _processPayment,
                  child: const Text("Ödemeyi Tamamla"),
                ),
          ],
        ),
      ),
    );
  }
}
