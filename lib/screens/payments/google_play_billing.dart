// lib/screens/payments/google_play_billing.dart

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class GooglePlayBillingScreen extends StatefulWidget {
  const GooglePlayBillingScreen({super.key});

  @override
  State<GooglePlayBillingScreen> createState() =>
      _GooglePlayBillingScreenState();
}

class _GooglePlayBillingScreenState extends State<GooglePlayBillingScreen> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late Stream<List<PurchaseDetails>> _subscriptionStream;

  @override
  void initState() {
    super.initState();
    _subscriptionStream = _inAppPurchase.purchaseStream;
    _initialize();
  }

  void _initialize() async {
    final bool available = await _inAppPurchase.isAvailable();
    if (!available) {
      debugPrint('In-app purchases not available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Play Ödemeleri')),
      body: StreamBuilder<List<PurchaseDetails>>(
        stream: _subscriptionStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final purchases = snapshot.data ?? [];

          return ListView.builder(
            itemCount: purchases.length,
            itemBuilder: (context, index) {
              final purchase = purchases[index];
              return ListTile(
                title: Text(purchase.productID),
                subtitle: Text(purchase.status.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
