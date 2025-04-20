import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yardım / Destek'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Uygulama Kullanım Rehberi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          HelpItem(
            icon: Icons.login,
            title: 'Giriş & Kayıt',
            description:
                'Uygulamaya kayıt olarak giriş yapabilir, abonelik planınızı seçerek kullanmaya başlayabilirsiniz.',
          ),
          HelpItem(
            icon: Icons.settings,
            title: 'Ayarlar',
            description:
                'Profil bilgilerinizi düzenleyebilir, tema ayarlarını değiştirebilirsiniz.',
          ),
          HelpItem(
            icon: Icons.lock,
            title: 'Güvenlik',
            description:
                'Şifrenizi değiştirebilir veya hesabınızı kalıcı olarak silebilirsiniz.',
          ),
          HelpItem(
            icon: Icons.support,
            title: 'Destek',
            description:
                'Herhangi bir sorunla karşılaşırsanız destek ekibimize ulaşabilirsiniz.',
          ),
          SizedBox(height: 30),
          Text(
            'İletişim',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('E-posta: destek@esnafpanel.com'),
          Text('Telefon: 0 (850) 123 45 67'),
        ],
      ),
    );
  }
}

class HelpItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const HelpItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
