import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:esnafpanel_mobile/firebase/firebase_options.dart';
import 'package:esnafpanel_mobile/providers/business_provider.dart';
import 'package:esnafpanel_mobile/providers/subscription_provider.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';

import 'package:esnafpanel_mobile/screens/abone/abone_kontrol_screen.dart';
import 'package:esnafpanel_mobile/screens/auth/login_screen.dart';
import 'package:esnafpanel_mobile/screens/auth/register_continue_screen.dart';
import 'package:esnafpanel_mobile/screens/backup/yedekleme_screen.dart';
import 'package:esnafpanel_mobile/screens/business/business_dashboard_screen.dart';
import 'package:esnafpanel_mobile/screens/business/business_selection_screen.dart';
import 'package:esnafpanel_mobile/screens/customers/customer_management_screen.dart';
import 'package:esnafpanel_mobile/screens/help/help_screen.dart';
import 'package:esnafpanel_mobile/screens/integrations/instagram_integration.dart';
import 'package:esnafpanel_mobile/screens/integrations/whatsapp_integration.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';
import 'package:esnafpanel_mobile/screens/notifications/notifications_screen.dart';
import 'package:esnafpanel_mobile/screens/orders/order_appointment_screen.dart';
import 'package:esnafpanel_mobile/screens/payments/google_play_billing.dart';
import 'package:esnafpanel_mobile/screens/payments/payment_screen.dart'
    as payment1;
import 'package:esnafpanel_mobile/screens/reports/report_screen.dart';
import 'package:esnafpanel_mobile/screens/security/change_password_screen.dart';
import 'package:esnafpanel_mobile/screens/security/security_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/profile_edit_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/settings_screen.dart';
import 'package:esnafpanel_mobile/screens/splash/splash_screen.dart';
import 'package:esnafpanel_mobile/screens/subscription/payment_screen.dart'
    as payment2;
import 'package:esnafpanel_mobile/screens/subscription/subscription_screen.dart';

import 'package:esnafpanel_mobile/theme/app_theme.dart';

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
        ChangeNotifierProvider(create: (_) => BusinessProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EsnafPanel',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterContinueScreen(),
              '/main': (context) => const MainPanelScreen(),
              '/business_selection':
                  (context) => const BusinessSelectionScreen(),
              '/business_dashboard':
                  (context) => const BusinessDashboardScreen(),
              '/profile_edit': (context) => const ProfileEditScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/security': (context) => const SecurityScreen(),
              '/change_password': (context) => const ChangePasswordScreen(),
              '/subscription': (context) => const SubscriptionScreen(),
              '/subscription_payment':
                  (context) => const payment2.PaymentScreen(),
              '/google_play_billing':
                  (context) => const GooglePlayBillingScreen(),
              '/payment': (context) => const payment1.PaymentScreen(),
              '/abone_kontrol': (context) => const AboneKontrolScreen(),
              '/customer_management':
                  (context) => const CustomerManagementScreen(),
              '/notifications': (context) => const NotificationsScreen(),
              '/order_appointment': (context) => const OrderAppointmentScreen(),
              '/report': (context) => const ReportScreen(),
              '/instagram_integration':
                  (context) => const InstagramIntegrationScreen(),
              '/whatsapp_integration':
                  (context) => const WhatsAppIntegrationScreen(),
              '/backup': (context) => const YedeklemeScreen(),
              '/help': (context) => const HelpScreen(),
            },
          );
        },
      ),
    );
  }
}
