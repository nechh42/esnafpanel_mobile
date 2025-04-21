import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/business_provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final business = Provider.of<BusinessProvider>(context).selectedBusiness;

    return Scaffold(
      appBar: AppBar(title: const Text('Raporlar')),
      body:
          business == null
              ? const Center(child: Text('Lütfen bir işletme seçin'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text(
                      'İşletme: ${business.name}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildReportTile('Toplam Sipariş', '128'),
                    _buildReportTile('Toplam Gelir', '₺15.200'),
                    _buildReportTile('Yeni Müşteri', '34'),
                    _buildReportTile(
                      'Popülerlik Durumu',
                      business.isPopular ? 'Popüler' : 'Standart',
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Rapor dışa aktarıldı')),
                        );
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Raporu Dışa Aktar'),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildReportTile(String title, String value) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
