// lib/screens/business/business_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

class BusinessSelectionScreen extends StatefulWidget {
  const BusinessSelectionScreen({Key? key}) : super(key: key);

  @override
  State<BusinessSelectionScreen> createState() =>
      _BusinessSelectionScreenState();
}

class _BusinessSelectionScreenState extends State<BusinessSelectionScreen> {
  BusinessModel? _selectedBusiness;

  final List<BusinessModel> businesses = [
    BusinessModel(
      id: '1',
      name: 'Kuaför Derya',
      ownerName: 'Derya',
      isPopular: true,
    ),
    BusinessModel(
      id: '2',
      name: 'Güzellik Salonu Lavinya',
      ownerName: 'Lavinya',
      isPopular: true,
    ),
    BusinessModel(
      id: '3',
      name: 'Berber Mehmet',
      ownerName: 'Mehmet',
      isPopular: true,
    ),
    BusinessModel(
      id: '4',
      name: 'Tırnak Atölyesi Estetik',
      ownerName: 'Ayşe',
      isPopular: true,
    ),
    BusinessModel(id: '5', name: 'Masaj Salonu Lotus', ownerName: 'Lotus'),
    BusinessModel(id: '6', name: 'Hair Studio Glamour', ownerName: 'Selin'),
    BusinessModel(
      id: '7',
      name: 'Cilt Bakım Merkezi Shine',
      ownerName: 'Zeynep',
    ),
    BusinessModel(
      id: '8',
      name: 'Saç Ekim Merkezi Gold Estetik',
      ownerName: 'Burak',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    businesses.sort((a, b) {
      if (a.isPopular && !b.isPopular) return -1;
      if (!a.isPopular && b.isPopular) return 1;
      return 0;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('İşletme Seç')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: businesses.length,
              itemBuilder: (context, index) {
                final business = businesses[index];
                return ListTile(
                  title: Text(business.name),
                  subtitle: Text("Sahibi: ${business.ownerName}"),
                  trailing:
                      business.isPopular
                          ? const Icon(Icons.star, color: Colors.orange)
                          : null,
                  selected: _selectedBusiness == business,
                  onTap: () {
                    setState(() {
                      _selectedBusiness = business;
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed:
                _selectedBusiness == null
                    ? null
                    : () {
                      Provider.of<BusinessProvider>(
                        context,
                        listen: false,
                      ).setSelectedBusiness(_selectedBusiness!);
                      Navigator.pushReplacementNamed(
                        context,
                        '/registerContinue',
                      );
                    },
            child: const Text('Devam Et'),
          ),
        ],
      ),
    );
  }
}
