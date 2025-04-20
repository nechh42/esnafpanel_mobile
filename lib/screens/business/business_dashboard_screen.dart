import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessDashboardScreen extends StatelessWidget {
  final String businessId;

  const BusinessDashboardScreen({Key? key, required this.businessId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İşletme Paneli')),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance
                .collection('businesses')
                .doc(businessId)
                .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('İşletme bilgisi bulunamadı.'));
          }

          final businessData = snapshot.data!.data() as Map<String, dynamic>;
          final businessName = businessData['name'] ?? 'İşletme';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hoş geldiniz, $businessName',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _DashboardCard(
                      title: 'Müşteriler',
                      icon: Icons.people,
                      route: '/customers',
                    ),
                    _DashboardCard(
                      title: 'Siparişler',
                      icon: Icons.receipt_long,
                      route: '/orders',
                    ),
                    _DashboardCard(
                      title: 'Raporlama',
                      icon: Icons.bar_chart,
                      route: '/report',
                    ),
                    _DashboardCard(
                      title: 'Ayarlar',
                      icon: Icons.settings,
                      route: '/settings',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: SizedBox(
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
