// lib/screens/payment/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/screens/payment/google_play_billing.dart';
import 'package:in_app_purchase/in_app_purchase.dart'; // Ensure this package is added to your pubspec.yaml

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GooglePlayBillingService _billingService = GooglePlayBillingService();

  @override
  void initState() {
    super.initState();
    _billingService.initialize();
  }

  @override
  void dispose() {
    _billingService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Abonelik Planları')),
      body: StreamBuilder<List<ProductDetails>>(
        stream: Stream.value(_billingService.products),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return const Center(child: Text('Ürün bulunamadı.'));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Text(product.price),
                  onTap: () => _billingService.buyProduct(product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
