import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/subscription_provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Abonelik Planı Seç")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Aşağıdan bir abonelik planı seçin:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: subscriptionProvider.products.length,
                itemBuilder: (context, index) {
                  final product = subscriptionProvider.products[index];
                  return Card(
                    child: ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing: Text(product.price),
                      onTap: () {
                        subscriptionProvider.buySubscription(product);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
