import 'package:flutter/material.dart';

class OrderAppointmentScreen extends StatelessWidget {
  const OrderAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sipariş & Randevu')),
      body: const Center(
        child: Text('Sipariş ve randevu işlemleri burada yönetilir.'),
      ),
    );
  }
}
