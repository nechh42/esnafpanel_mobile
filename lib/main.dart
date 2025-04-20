import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase/firebase_options.dart';
import 'providers/theme_provider.dart';
import 'theme/app_theme.dart';
import 'theme/theme_customizer.dart';

import 'screens/auth/login_screen.dart';
import 'screens/auth/register_continue_screen.dart';
import 'screens/subscription/subscription_screen.dart';
import 'screens/payment/payment_screen.dart';
import 'screens/payment/google_play_billing.dart';
import 'screens/main_panel/main_panel_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'theme/theme_screen.dart';
import 'screens/security/security_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/help/help_screen.dart';
import 'screens/integrations/whatsapp_integration.dart';
import 'screens/integrations/instagram_integration.dart';
import 'screens/report/report_screen.dart';
import 'screens/customer/customer_management_screen.dart';
import 'screens/order/order_appointment_screen.dart';
import 'services/abone_kontrol_service.dart';
import 'services/yedekleme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EsnafPanel',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register_continue': (context) => const RegisterContinueScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/google_play_billing': (context) => const GooglePlayBillingScreen(),
        '/mainPanel': (context) => const MainPanelScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/theme': (context) => const ThemeScreen(),
        '/security': (context) => const SecurityScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/help': (context) => const HelpScreen(),
        '/whatsapp': (context) => const WhatsAppIntegrationScreen(),
        '/instagram': (context) => const InstagramIntegrationScreen(),
        '/reports': (context) => const ReportScreen(),
        '/customers': (context) => const CustomerManagementScreen(),
        '/orders': (context) => const OrderAppointmentScreen(),
        '/theme_customizer': (context) => const ThemeCustomizer(),
      },
    );
  }
}
