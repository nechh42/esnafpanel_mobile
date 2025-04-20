import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';
import 'providers/theme_provider.dart';

import 'screens/payments/payment_screen.dart';
import 'screens/payments/google_play_billing.dart';
import 'screens/integrations/whatsapp_integration.dart';
import 'screens/integrations/instagram_integration.dart';
import 'screens/business/business_dashboard_screen.dart';

import 'theme/app_theme.dart';
import 'theme/theme_customizer.dart';

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
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EsnafPanel',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/',
            routes: {
              '/':
                  (context) => const BusinessDashboardScreen(
                    businessId: 'test_business',
                  ),
              '/payment': (context) => const PaymentScreen(),
              '/google_play_billing':
                  (context) => const GooglePlayBillingScreen(),
              '/whatsapp': (context) => const WhatsAppIntegrationScreen(),
              '/instagram': (context) => const InstagramIntegrationScreen(),
              '/theme_customizer': (context) => const ThemeCustomizer(),
            },
          );
        },
      ),
    );
  }
}
