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
        icon: Icons.notifications_none,
        title: 'Bildirimler',
        route: '/notifications',
      ),
      _PanelItem(
        icon: Icons.settings_outlined,
        title: 'Ayarlar',
        route: '/settings',
      ),
      _PanelItem(
        icon: Icons.lock_outline,
        title: 'Güvenlik',
        route: '/security',
      ),
      _PanelItem(icon: Icons.help_outline, title: 'Yardım', route: '/help'),
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
              panelItems
                  .map(
                    (item) => GestureDetector(
                      onTap: () => navigateTo(context, item.route),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item.icon, size: 48),
                            const SizedBox(height: 10),
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
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
