import 'package:flutter/material.dart';

class CustomerManagementScreen extends StatelessWidget {
  const CustomerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Müşteri Yönetimi')),
      body: const Center(
        child: Text('Müşteri listesi ve işlemleri burada yapılır.'),
      ),
    );
  }
}
