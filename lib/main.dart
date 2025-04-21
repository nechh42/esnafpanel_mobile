import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'providers/theme_provider.dart';
import 'package:provider/provider.dart';

// Ekranlar
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_continue_screen.dart';
import 'screens/subscription/subscription_screen.dart';
import 'screens/payment/payment_screen.dart';
import 'screens/main_panel/main_panel_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/security/security_screen.dart';
import 'screens/help/help_screen.dart';
import 'screens/report/report_screen.dart';
import 'screens/customer/customer_management_screen.dart';
import 'screens/order/order_appointment_screen.dart';
import 'screens/integrations/whatsapp_integration.dart';
import 'screens/integrations/instagram_integration.dart';
import 'theme/theme_screen.dart';
import 'theme/theme_customizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const EsnafPanelApp(),
    ),
  );
}

class EsnafPanelApp extends StatelessWidget {
  const EsnafPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EsnafPanel',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register_continue': (context) => const RegisterContinueScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/mainPanel': (context) => const MainPanelScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/security': (context) => const SecurityScreen(),
        '/help': (context) => const HelpScreen(),
        '/report': (context) => const ReportScreen(),
        '/customers': (context) => const CustomerManagementScreen(),
        '/orders': (context) => const OrderAppointmentScreen(),
        '/whatsapp': (context) => const WhatsappIntegrationScreen(),
        '/instagram': (context) => const InstagramIntegrationScreen(),
        '/theme': (context) => const ThemeScreen(),
        '/theme_customizer': (context) => const ThemeCustomizerScreen(),
      },
    );
  }
}
