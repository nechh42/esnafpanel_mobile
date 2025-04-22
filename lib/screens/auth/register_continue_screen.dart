import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';

class RegisterContinueScreen extends StatefulWidget {
  const RegisterContinueScreen({super.key});

  @override
  State<RegisterContinueScreen> createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  BusinessModel? _selectedBusiness;

  @override
  Widget build(BuildContext context) {
    final businesses = Provider.of<BusinessProvider>(context).businessList;

    return Scaffold(
      appBar: AppBar(title: const Text('İşletme Seç')),
      body: Column(
        children: [
          ...businesses.map((b) => RadioListTile<BusinessModel>(
                title: Text(b.name),
                value: b,
                groupValue: _selectedBusiness,
                onChanged: (value) {
                  setState(() {
                    _selectedBusiness = value;
                  });
                },
              )),
          ElevatedButton(
            onPressed: () {
              if (_selectedBusiness != null) {
                Provider.of<BusinessProvider>(context, listen: false)
                    .setBusiness(_selectedBusiness!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainPanelScreen(),
                  ),
                );
              }
            },
            child: const Text("Devam Et"),
          ),
        ],
      ),
    );
  }
}
