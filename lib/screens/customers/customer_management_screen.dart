import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

class CustomerManagementScreen extends StatelessWidget {
  const CustomerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final businessProvider = Provider.of<BusinessProvider>(context);
    final business = businessProvider.selectedBusiness;

    return Scaffold(
      appBar: AppBar(title: const Text('Müşteri Yönetimi')),
      body:
          business == null
              ? const Center(child: Text('Lütfen önce bir işletme seçin.'))
              : Center(
                child: Text(
                  'İşletme: ${business.businessName} için müşteri yönetimi ekranı',
                ),
              ),
    );
  }
}
