// 📄 lib/screens/business/business_dashboard_screen.dart (girişte null kontrolü)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

class BusinessDashboardScreen extends StatelessWidget {
  const BusinessDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final business = Provider.of<BusinessProvider>(context).selectedBusiness;

    if (business == null) {
      return const Scaffold(body: Center(child: Text("İşletme seçilmedi.")));
    }

    return Scaffold(
      appBar: AppBar(title: Text(business.name)),
      body: Center(child: Text("Hoş geldiniz, ${business.ownerName}")),
    );
  }
}
