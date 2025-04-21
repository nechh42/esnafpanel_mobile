import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';

import 'package:esnafpanel_mobile/screens/notifications/notifications_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/settings_screen.dart';
import 'package:esnafpanel_mobile/screens/payments/payment_screen.dart';
import 'package:esnafpanel_mobile/screens/customers/customer_management_screen.dart';
import 'package:esnafpanel_mobile/screens/orders/order_appointment_screen.dart';
import 'package:esnafpanel_mobile/screens/reports/report_screen.dart';
import 'package:esnafpanel_mobile/screens/security/security_screen.dart';
import 'package:esnafpanel_mobile/screens/help/help_screen.dart';
import 'package:esnafpanel_mobile/screens/backup/yedekleme_screen.dart';

class MainPanelScreen extends StatelessWidget {
  const MainPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final business = Provider.of<BusinessProvider>(context).selectedBusiness;

    return Scaffold(
      appBar: AppBar(
        title: Text(business != null ? "${business.name} Paneli" : "Ana Panel"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildTile(
            context,
            "Bildirimler",
            Icons.notifications,
            NotificationsScreen(),
          ),
          _buildTile(context, "Ödemeler", Icons.payment, PaymentScreen()),
          _buildTile(
            context,
            "Müşteriler",
            Icons.people,
            CustomerManagementScreen(),
          ),
          _buildTile(
            context,
            "Randevular",
            Icons.calendar_today,
            OrderAppointmentScreen(),
          ),
          _buildTile(context, "Raporlar", Icons.bar_chart, ReportScreen()),
          _buildTile(context, "Güvenlik", Icons.lock, SecurityScreen()),
          _buildTile(context, "Yardım", Icons.help, HelpScreen()),
          _buildTile(context, "Yedekleme", Icons.backup, YedeklemeScreen()),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }
}
