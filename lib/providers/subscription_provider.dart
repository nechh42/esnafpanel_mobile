import 'package:flutter/material.dart';

class SubscriptionProduct {
  final String id;
  final String title;
  final String description;
  final String price;

  SubscriptionProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });
}

class SubscriptionProvider with ChangeNotifier {
  List<SubscriptionProduct> _products = [
    SubscriptionProduct(
      id: 'basic',
      title: 'Başlangıç Paketi',
      description: 'Temel özellikler',
      price: '₺19,99',
    ),
    SubscriptionProduct(
      id: 'pro',
      title: 'Pro Paket',
      description: 'Tüm özellikler',
      price: '₺49,99',
    ),
  ];

  List<SubscriptionProduct> get products => _products;

  void buySubscription(SubscriptionProduct product) {
    // Gerçek satın alma işlemi burada olur
    print('Satın alındı: ${product.id}');
    notifyListeners();
  }
}
