import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'destek@esnafpanel.com',
      query: 'subject=Destek Talebi',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/905555555555?text=Merhaba,%20destek%20almak%20istiyorum',
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yardım ve Destek')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Sıkça Sorulan Sorular',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildFaqTile(
            'İşletme nasıl eklenir?',
            'Ana panelden "İşletme Seç" butonuna tıklayıp yeni işletme ekleyebilirsiniz.',
          ),
          _buildFaqTile(
            'Abonelik nasıl çalışır?',
            'Uygulama içerisindeki abonelik ekranından aylık planlara geçebilirsiniz.',
          ),
          _buildFaqTile(
            'Verilerim güvende mi?',
            'Tüm verileriniz Firebase tarafından güvenle saklanmaktadır.',
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          const Text(
            'Destek Alın',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _launchEmail,
            icon: const Icon(Icons.email),
            label: const Text('E-posta ile Destek'),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _launchWhatsApp,
            icon: const FaIcon(FontAwesomeIcons.whatsapp),
            label: const Text('WhatsApp ile Destek'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqTile(String question, String answer) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(answer),
        ),
      ],
    );
  }
}
