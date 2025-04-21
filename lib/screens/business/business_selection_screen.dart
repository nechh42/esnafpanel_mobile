import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/business_model.dart';
import '../../providers/business_provider.dart';
import 'business_dashboard_screen.dart';

class BusinessSelectionScreen extends StatefulWidget {
  const BusinessSelectionScreen({super.key});

  @override
  State<BusinessSelectionScreen> createState() =>
      _BusinessSelectionScreenState();
}

class _BusinessSelectionScreenState extends State<BusinessSelectionScreen> {
  final List<BusinessModel> businesses = [
    BusinessModel(id: '1', name: 'Kuaför Derya', isPopular: true),
    BusinessModel(id: '2', name: 'Güzellik Salonu Lavinya', isPopular: true),
    BusinessModel(id: '3', name: 'Berber Mehmet', isPopular: true),
    BusinessModel(id: '4', name: 'Tırnak Atölyesi Estetik', isPopular: true),
    BusinessModel(id: '5', name: 'Masaj Salonu Lotus'),
    BusinessModel(id: '6', name: 'Hair Studio Glamour'),
    BusinessModel(id: '7', name: 'Cilt Bakım Merkezi Shine'),
    BusinessModel(id: '8', name: 'Saç Ekim Merkezi Gold Estetik'),
  ];

  BusinessModel? _selectedBusiness;
  final TextEditingController _customBusinessController =
      TextEditingController();
  bool _isCustomBusiness = false;

  @override
  Widget build(BuildContext context) {
    final sortedBusinesses = [...businesses];
    sortedBusinesses.sort((a, b) {
      if (a.isPopular && !b.isPopular) return -1;
      if (!a.isPopular && b.isPopular) return 1;
      return 0;
    });

    return Scaffold(
      appBar: AppBar(title: const Text("İşletme Seçimi"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Lütfen işletmenizi seçiniz:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: sortedBusinesses.length + 1,
                itemBuilder: (context, index) {
                  if (index == sortedBusinesses.length) {
                    return ListTile(
                      title: const Text("Diğer (Kendi işletmemi ekleyeceğim)"),
                      leading: Radio<BusinessModel>(
                        value: BusinessModel(
                          id: '',
                          name: '',
                          isPopular: false,
                        ),
                        groupValue: _selectedBusiness,
                        onChanged: (value) {
                          setState(() {
                            _isCustomBusiness = true;
                            _selectedBusiness = null;
                          });
                        },
                      ),
                    );
                  }

                  final business = sortedBusinesses[index];
                  return ListTile(
                    title: Text(business.name),
                    leading: Radio<BusinessModel>(
                      value: business,
                      groupValue: _selectedBusiness,
                      onChanged: (value) {
                        setState(() {
                          _isCustomBusiness = false;
                          _selectedBusiness = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            if (_isCustomBusiness)
              TextField(
                controller: _customBusinessController,
                decoration: const InputDecoration(labelText: "İşletme Adı"),
              ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final provider = Provider.of<BusinessProvider>(
                  context,
                  listen: false,
                );
                if (_isCustomBusiness) {
                  final customName = _customBusinessController.text.trim();
                  if (customName.isNotEmpty) {
                    final newBusiness = BusinessModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: customName,
                      isPopular: false,
                    );
                    provider.setBusiness(newBusiness);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BusinessDashboardScreen(),
                      ),
                    );
                  }
                } else if (_selectedBusiness != null) {
                  provider.setBusiness(_selectedBusiness!);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BusinessDashboardScreen(),
                    ),
                  );
                }
              },
              child: const Text("Devam Et"),
            ),
          ],
        ),
      ),
    );
  }
}
