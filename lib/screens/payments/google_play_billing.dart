import 'package:flutter/material.dart';

class GooglePlayBillingScreen extends StatelessWidget {
  const GooglePlayBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Play Ödeme'), centerTitle: true),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Bu ekran, Google Play üzerinden yapılan abonelik işlemleriyle ilgili bilgi ve geçmiş ödemeleri gösterecek şekilde tasarlanmıştır.\n\n(Not: Şu an sadece test amaçlıdır.)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
