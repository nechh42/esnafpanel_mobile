import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final businessProvider = Provider.of<BusinessProvider>(context);
    final businessName = businessProvider.selectedBusiness?.name ?? 'İşletme';

    return Scaffold(
      appBar: AppBar(title: Text('$businessName Bildirimler')),
      body: const Center(
        child: Text(
          'Bildirimler yakında burada görünecek.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
