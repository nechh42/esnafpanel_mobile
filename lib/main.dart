import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase/firebase_options.dart';
import 'providers/theme_provider.dart';

import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_continue_screen.dart';
import 'screens/subscription/subscription_screen.dart';
import 'screens/payment/payment_screen.dart';
import 'screens/main_panel/main_panel_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/security/security_screen.dart';
import 'screens/help/help_screen.dart';
import 'screens/integrations/whatsapp_integration.dart';
import 'screens/integrations/instagram_integration.dart';
import 'screens/report/report_screen.dart';
import 'screens/customer/customer_management_screen.dart';
import 'screens/order/order_appointment_screen.dart';
import 'screens/payment/google_play_billing.dart';
import 'theme/theme_screen.dart';
import 'theme/theme_customizer.dart';
import 'screens/abone/abone_kontrol_screen.dart'; // ✅ Yeni eklendi
import 'screens/backup/yedekleme_screen.dart'; // ✅ Yeni eklendi

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const EsnafPanelApp());
}

class EsnafPanelApp extends StatelessWidget {
  const EsnafPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: const SplashScreen(),
            routes: {
              '/login': (_) => const LoginScreen(),
              '/register_continue': (_) => const RegisterContinueScreen(),
              '/subscription': (_) => const SubscriptionScreen(),
              '/payment': (_) => const PaymentScreen(),
              '/main_panel': (_) => const MainPanelScreen(),
              '/settings': (_) => const SettingsScreen(),
              '/notifications': (_) => const NotificationsScreen(),
              '/security': (_) => const SecurityScreen(),
              '/help': (_) => const HelpScreen(),
              '/whatsapp': (_) => const WhatsAppIntegrationScreen(),
              '/instagram': (_) => const InstagramIntegrationScreen(),
              '/report': (_) => const ReportScreen(),
              '/customers': (_) => const CustomerManagementScreen(),
              '/orders': (_) => const OrderAppointmentScreen(),
              '/google_billing': (_) => const GooglePlayBillingScreen(),
              '/theme': (_) => const ThemeScreen(),
              '/theme_customizer': (_) => const ThemeCustomizerScreen(),
              '/abone_kontrol': (_) => const AboneKontrolScreen(), // ✅ Yeni
              '/yedekleme': (_) => const YedeklemeScreen(), // ✅ Yeni
            },
          );
        },
      ),
    );
  }
}
