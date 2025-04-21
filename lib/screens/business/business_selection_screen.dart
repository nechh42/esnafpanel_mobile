import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';
import 'package:esnafpanel_mobile/screens/business/business_dashboard_screen.dart';

class BusinessSelectionScreen extends StatefulWidget {
  const BusinessSelectionScreen({super.key});

  @override
  State<BusinessSelectionScreen> createState() =>
      _BusinessSelectionScreenState();
}

class _BusinessSelectionScreenState extends State<BusinessSelectionScreen> {
  final List<Map<String, dynamic>> predefinedBusinesses = [
    {'name': 'Cafe', 'isPopular': true},
    {'name': 'Berber Salonu', 'isPopular': true},
    {'name': 'Güzellik Merkezi', 'isPopular': true},
    {'name': 'Restoran', 'isPopular': false},
    {'name': 'Market', 'isPopular': false},
    {'name': 'Çiçekçi', 'isPopular': false},
    {'name': 'Fırın', 'isPopular': false},
    {'name': 'Parfümeri/Kozmetik', 'isPopular': false},
    {'name': 'Moda/Butik', 'isPopular': false},
  ];

  final TextEditingController _customBusinessController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final businessProvider = Provider.of<BusinessProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('İşletme Seçimi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Bir işletme seçin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: predefinedBusinesses.length,
                itemBuilder: (context, index) {
                  final business = predefinedBusinesses[index];
                  return Card(
                    child: ListTile(
                      title: Text(business['name']),
                      trailing:
                          business['isPopular']
                              ? const Icon(Icons.star, color: Colors.orange)
                              : const Icon(Icons.chevron_right),
                      onTap: () {
                        businessProvider.selectBusiness(
                          BusinessModel(
                            name: business['name'],
                            isPopular: business['isPopular'],
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => const BusinessDashboardScreen(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Kendi işletmeni ekle:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _customBusinessController,
                    decoration: const InputDecoration(
                      hintText: 'İşletme adı girin',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final customName = _customBusinessController.text.trim();
                    if (customName.isNotEmpty) {
                      businessProvider.selectBusiness(
                        BusinessModel(name: customName, isPopular: false),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessDashboardScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('Ekle'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
