import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yardım"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Sık Sorulan Sorular",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "• Kayıt olurken sorun yaşıyorum.\n"
            "Cevap: Lütfen geçerli bir e-posta ve şifre kullandığınızdan emin olun.\n\n"
            "• Ödeme yapamıyorum.\n"
            "Cevap: Ödeme bilgilerinizin güncel olduğundan ve internet bağlantınızın açık olduğundan emin olun.\n\n"
            "• Hesabımı nasıl silebilirim?\n"
            "Cevap: Profil ayarlarından hesabınızı silebilirsiniz veya destek ekibimizle iletişime geçin.",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Text(
            "İletişim",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Herhangi bir sorunuz varsa bize şu kanallardan ulaşabilirsiniz:\n"
            "• E-posta: destek@esnafpanel.com\n"
            "• Telefon: +90 850 000 0000",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
