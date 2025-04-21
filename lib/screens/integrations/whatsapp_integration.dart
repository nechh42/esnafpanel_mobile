import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatsAppIntegrationScreen extends StatelessWidget {
  const WhatsAppIntegrationScreen({Key? key}) : super(key: key);

  void _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/905555555555');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('WhatsApp açılamadı.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WhatsApp Entegrasyonu')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _launchWhatsApp,
          icon: const FaIcon(FontAwesomeIcons.whatsapp),
          label: const Text('WhatsApp ile İletişime Geç'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
      ),
    );
  }
}
