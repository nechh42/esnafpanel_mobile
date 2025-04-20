import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/subscription_provider.dart';
import 'theme/app_theme.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_continue_screen.dart';
import 'screens/payment/payment_screen.dart';
import 'screens/subscription/subscription_screen.dart';
import 'screens/main_panel/main_panel_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/security/security_screen.dart';
import 'screens/help/help_screen.dart';
import 'screens/customer/customer_management_screen.dart';
import 'screens/order/order_appointment_screen.dart';
import 'screens/integrations/whatsapp_integration.dart';
import 'screens/integrations/instagram_integration.dart';
import 'screens/report/report_screen.dart';
import 'screens/payment/google_play_billing.dart';
import 'theme/theme_customizer.dart';

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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EsnafPanel',
            theme: lightTheme,
            darkTheme: darkTheme,
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
              '/customers': (context) => const CustomerManagementScreen(),
              '/orders': (context) => const OrderAppointmentScreen(),
              '/whatsapp': (context) => const WhatsappIntegrationScreen(),
              '/instagram': (context) => const InstagramIntegrationScreen(),
              '/reports': (context) => const ReportScreen(),
              '/google_play_billing':
                  (context) => const GooglePlayBillingScreen(),
              '/theme_customizer': (context) => const ThemeCustomizerScreen(),
            },
          );
        },
      ),
    );
  }
}
