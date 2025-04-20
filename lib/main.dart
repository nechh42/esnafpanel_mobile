import 'package:esnafpanel_mobile/firebase/firebase_options.dart';
import 'package:esnafpanel_mobile/providers/subscription_provider.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';
import 'package:esnafpanel_mobile/screens/auth/login_screen.dart';
import 'package:esnafpanel_mobile/screens/auth/register_continue_screen.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';
import 'package:esnafpanel_mobile/screens/notifications/notifications_screen.dart';
import 'package:esnafpanel_mobile/screens/payment/payment_screen.dart';
import 'package:esnafpanel_mobile/screens/security/security_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/settings_screen.dart';
import 'package:esnafpanel_mobile/screens/subscription/subscription_screen.dart';
import 'package:esnafpanel_mobile/screens/help/help_screen.dart';
import 'package:esnafpanel_mobile/screens/integrations/instagram_integration.dart';
import 'package:esnafpanel_mobile/screens/integrations/whatsapp_integration.dart';
import 'package:esnafpanel_mobile/screens/report/report_screen.dart';
import 'package:esnafpanel_mobile/screens/customer/customer_management_screen.dart';
import 'package:esnafpanel_mobile/screens/order/order_appointment_screen.dart';
import 'package:esnafpanel_mobile/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const EsnafPanelApp());
}

class EsnafPanelApp extends StatelessWidget {
  const EsnafPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EsnafPanel',
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register_continue': (context) => const RegisterContinueScreen(),
              '/subscription': (context) => const SubscriptionScreen(),
              '/payment': (context) => const PaymentScreen(),
              '/main_panel': (context) => const MainPanelScreen(),
              '/notifications': (context) => const NotificationsScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/security': (context) => const SecurityScreen(),
              '/help': (context) => const HelpScreen(),
              '/instagram': (context) => const InstagramIntegrationScreen(),
              '/whatsapp': (context) => const WhatsappIntegrationScreen(),
              '/report': (context) => const ReportScreen(),
              '/customer': (context) => const CustomerManagementScreen(),
              '/order': (context) => const OrderAppointmentScreen(),
              '/abone_kontrol': (context) => const SubscriptionScreen(),
              '/yedekleme':
                  (context) => const HelpScreen(), // Geçici yönlendirme
            },
          );
        },
      ),
    );
  }
}
