import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/business_provider.dart';

class BusinessDashboardScreen extends StatelessWidget {
  const BusinessDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final business = Provider.of<BusinessProvider>(context).selectedBusiness;

    return Scaffold(
      appBar: AppBar(title: const Text("İşletme Paneli"), centerTitle: true),
      body:
          business == null
              ? const Center(child: Text("İşletme seçilmedi."))
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      business.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "ID: ${business.id}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (business.ownerName != null &&
                        business.ownerName!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        "İşletme Sahibi: ${business.ownerName!}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Çıkış Yap"),
                    ),
                  ],
                ),
              ),
    );
  }
}
