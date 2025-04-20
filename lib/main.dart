// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
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
// Removed duplicate import of 'screens/report/report_screen.dart'
import 'screens/customer/customer_management_screen.dart';
import 'screens/order/order_appointment_screen.dart';
import 'screens/payment/google_play_billing.dart';
import 'theme/theme_customizer.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/report/report_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EsnafPanel',
            theme: themeProvider.themeData,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register_continue': (context) => const RegisterContinueScreen(),
              '/subscription': (context) => const SubscriptionScreen(),
              '/payment': (context) => const PaymentScreen(),
              '/main_panel': (context) => const MainPanelScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/notifications': (context) => const NotificationsScreen(),
              '/security': (context) => const SecurityScreen(),
              '/help': (context) => const HelpScreen(),
              '/whatsapp': (context) => const WhatsAppIntegrationScreen(),
              '/instagram': (context) => const InstagramIntegrationScreen(),
              '/report': (context) => ReportScreen(userPlan: 'defaultPlan'),
              '/customers': (context) => const CustomerManagementScreen(),
              '/orders': (context) => const OrderAppointmentScreen(),
              '/billing': (context) => const GooglePlayBillingScreen(),
              '/theme_customizer': (context) => const ThemeCustomizerScreen(),
            },
          );
        },
      ),
    );
  }
}
