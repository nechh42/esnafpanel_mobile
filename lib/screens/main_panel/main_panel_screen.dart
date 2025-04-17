import 'package:flutter/material.dart';

class MainPanelScreen extends StatelessWidget {
  const MainPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EsnafPanel - Ana Panel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildPanelTile(
              icon: Icons.notifications,
              title: 'Bildirimler',
              onTap: () => Navigator.pushNamed(context, '/notifications'),
            ),
            _buildPanelTile(
              icon: Icons.security,
              title: 'Güvenlik',
              onTap: () => Navigator.pushNamed(context, '/security'),
            ),
            _buildPanelTile(
              icon: Icons.settings,
              title: 'Ayarlar',
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            _buildPanelTile(
              icon: Icons.exit_to_app,
              title: 'Çıkış Yap',
              onTap:
                  () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanelTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal.shade800),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
