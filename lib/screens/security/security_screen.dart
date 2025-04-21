import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/screens/security/change_password_screen.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Güvenlik Ayarları")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.lock_reset),
            title: const Text("Şifreyi Değiştir"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Gizlilik Politikası"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text("Gizlilik Politikası"),
                      content: const Text(
                        "Uygulamanız kullanıcı bilgilerini gizli tutar ve asla 3. taraflarla paylaşmaz.",
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Tamam"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
