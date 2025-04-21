import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/business_model.dart';
import '../../../providers/business_provider.dart';
import '../../../screens/business/business_dashboard_screen.dart';

class RegisterContinueScreen extends StatefulWidget {
  const RegisterContinueScreen({Key? key}) : super(key: key);

  @override
  _RegisterContinueScreenState createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  BusinessModel? _selectedBusiness;
  final List<BusinessModel> _businessList = [
    BusinessModel(id: '1', name: 'Kuaför Derya', isPopular: true),
    BusinessModel(id: '2', name: 'Güzellik Salonu Lavinya', isPopular: true),
    BusinessModel(id: '3', name: 'Berber Kemal', isPopular: false),
    BusinessModel(id: '4', name: 'Erkek Kuaförü Star', isPopular: false),
    BusinessModel(id: '5', name: 'Salon İnci', isPopular: false),
    BusinessModel(
      id: '6',
      name: 'Cilt Bakım Merkezi Güzellik',
      isPopular: false,
    ),
    BusinessModel(id: '7', name: 'Masaj Salonu Lotus', isPopular: false),
    BusinessModel(id: '8', name: 'Bayan Kuaförü Melis', isPopular: false),
  ];

  final TextEditingController _customBusinessController =
      TextEditingController();

  @override
  void dispose() {
    _customBusinessController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_selectedBusiness != null) {
      Provider.of<BusinessProvider>(
        context,
        listen: false,
      ).setSelectedBusiness(_selectedBusiness!);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const BusinessDashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Lütfen bir işletme seçin')));
    }
  }

  @override
  Widget build(BuildContext context) {
    _businessList.sort((a, b) {
      if (a.isPopular && !b.isPopular) return -1;
      if (!a.isPopular && b.isPopular) return 1;
      return 0;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('İşletme Seçimi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Lütfen işletmenizi seçin:'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _businessList.length,
                itemBuilder: (context, index) {
                  final business = _businessList[index];
                  return RadioListTile<BusinessModel>(
                    title: Text(business.name),
                    value: business,
                    groupValue: _selectedBusiness,
                    onChanged: (value) {
                      setState(() {
                        _selectedBusiness = value;
                      });
                    },
                  );
                },
              ),
            ),
            TextField(
              controller: _customBusinessController,
              decoration: const InputDecoration(
                labelText: 'Diğer işletme (manuel giriş)',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  final customBusiness = BusinessModel(
                    name: value,
                    isPopular: false,
                  );
                  setState(() {
                    _selectedBusiness = customBusiness;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onContinue,
              child: const Text('Devam Et'),
            ),
          ],
        ),
      ),
    );
  }
}
