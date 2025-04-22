// lib/screens/reports/report_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final business = Provider.of<BusinessProvider>(context).selectedBusiness;

    return Scaffold(
      appBar: AppBar(title: const Text('Raporlar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            business == null
                ? const Text('İşletme bilgisi bulunamadı.')
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'İşletme: ${business.name}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 8),
                    Text('Sahibi: ${business.ownerName}'),
                    const SizedBox(height: 8),
                    Text(
                      'Durum: ${business.isPopular ? 'Popüler' : 'Standart'}',
                    ),
                    const SizedBox(height: 24),
                    const Text('Buraya işletmeyle ilgili raporlar gelecek...'),
                  ],
                ),
      ),
    );
  }
}
