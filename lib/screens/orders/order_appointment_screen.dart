import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/business_provider.dart';
import '../../../models/business_model.dart';

class OrderAppointmentScreen extends StatelessWidget {
  const OrderAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final businessProvider = Provider.of<BusinessProvider>(context);
    final BusinessModel? selectedBusiness = businessProvider.selectedBusiness;

    return Scaffold(
      appBar: AppBar(title: const Text('Randevu Siparişleri')),
      body:
          selectedBusiness == null
              ? const Center(child: Text("Lütfen bir işletme seçiniz."))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'İşletme: ${selectedBusiness.name}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'Henüz randevu siparişiniz bulunmamaktadır.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
