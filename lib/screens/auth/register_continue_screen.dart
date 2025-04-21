import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';
import 'package:esnafpanel_mobile/screens/business/business_dashboard_screen.dart';

class RegisterContinueScreen extends StatefulWidget {
  const RegisterContinueScreen({super.key});

  @override
  State<RegisterContinueScreen> createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  final TextEditingController _nameController = TextEditingController();
  BusinessModel? _selectedBusiness;

  final List<BusinessModel> _businessList = [
    BusinessModel(id: '1', name: 'Kuaför Derya', isPopular: true),
    BusinessModel(id: '2', name: 'Güzellik Salonu Lavinya', isPopular: true),
    BusinessModel(id: '3', name: 'Berber Mehmet'),
    BusinessModel(id: '4', name: 'Ayşe\'nin Güzellik Merkezi'),
    BusinessModel(id: '5', name: 'Barber Style'),
    BusinessModel(id: '6', name: 'BeautyLife Estetik'),
    BusinessModel(id: '7', name: 'Yusuf\'un Tıraş Salonu'),
    BusinessModel(id: '8', name: 'Gül Beauty Studio'),
  ];

  void _completeRegistration() {
    final name = _nameController.text.trim();
    if (name.isEmpty || _selectedBusiness == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen adınızı girin ve bir işletme seçin.'),
        ),
      );
      return;
    }

    Provider.of<BusinessProvider>(
      context,
      listen: false,
    ).setSelectedBusiness(_selectedBusiness!);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BusinessDashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _businessList.sort((a, b) {
      if (a.isPopular && !b.isPopular) return -1;
      if (!a.isPopular && b.isPopular) return 1;
      return a.name.compareTo(b.name);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Kaydı Tamamla')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Ad Soyad'),
            ),
            const SizedBox(height: 20),
            const Text('İşletme Seçimi'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _businessList.length,
                itemBuilder: (context, index) {
                  final business = _businessList[index];
                  return ListTile(
                    title: Text(business.name),
                    leading:
                        business.isPopular
                            ? const Icon(Icons.star, color: Colors.orange)
                            : const Icon(Icons.store),
                    trailing:
                        _selectedBusiness == business
                            ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                            : null,
                    onTap: () {
                      setState(() {
                        _selectedBusiness = business;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _completeRegistration,
              child: const Text('Kaydı Tamamla'),
            ),
          ],
        ),
      ),
    );
  }
}
