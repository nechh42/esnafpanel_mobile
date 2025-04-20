import 'package:flutter/material.dart';

class MainPanelScreen extends StatelessWidget {
  const MainPanelScreen({super.key});

  void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final List<_PanelItem> panelItems = [
      _PanelItem(
        icon: Icons.notifications,
        title: 'Bildirimler',
        route: '/notifications',
      ),
      _PanelItem(icon: Icons.settings, title: 'Ayarlar', route: '/settings'),
      _PanelItem(icon: Icons.lock, title: 'Güvenlik', route: '/security'),
      _PanelItem(icon: Icons.help, title: 'Yardım', route: '/help'),
      _PanelItem(
        icon: Icons.check_circle_outline,
        title: 'Abonelik Kontrol',
        route: '/abone_kontrol',
      ),
      _PanelItem(icon: Icons.backup, title: 'Yedekleme', route: '/yedekleme'),
      _PanelItem(
        icon: Icons.camera_alt,
        title: 'Instagram',
        route: '/instagram',
      ),
      _PanelItem(icon: Icons.message, title: 'WhatsApp', route: '/whatsapp'),
      _PanelItem(icon: Icons.bar_chart, title: 'Raporlama', route: '/report'),
      _PanelItem(icon: Icons.people, title: 'Müşteriler', route: '/customers'),
      _PanelItem(
        icon: Icons.shopping_cart,
        title: 'Sipariş/Randevu',
        route: '/orders',
      ),
      _PanelItem(
        icon: Icons.payment,
        title: 'Ödeme',
        route: '/google_play_billing',
      ),
      _PanelItem(
        icon: Icons.color_lens,
        title: 'Tema',
        route: '/theme_customizer',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('EsnafPanel'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children:
              panelItems.map((item) {
                return GestureDetector(
                  onTap: () => navigateTo(context, item.route),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item.icon, size: 42),
                        const SizedBox(height: 10),
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class _PanelItem {
  final IconData icon;
  final String title;
  final String route;

  _PanelItem({required this.icon, required this.title, required this.route});
}
