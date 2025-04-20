import 'package:esnafpanel_mobile/screens/auth/login_screen.dart';
import 'package:esnafpanel_mobile/screens/auth/register_continue_screen.dart';
import 'package:esnafpanel_mobile/screens/main_panel/main_panel_screen.dart';
import 'package:esnafpanel_mobile/screens/payment/payment_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/settings_screen.dart';
import 'package:esnafpanel_mobile/screens/notifications/notifications_screen.dart';
import 'package:esnafpanel_mobile/screens/security/security_screen.dart';
import 'package:esnafpanel_mobile/screens/help/help_screen.dart';
import 'package:esnafpanel_mobile/screens/subscription/subscription_screen.dart';
import 'package:esnafpanel_mobile/screens/splash/splash_screen.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';
import 'package:esnafpanel_mobile/providers/subscription_provider.dart';
import 'package:esnafpanel_mobile/screens/order/order_appointment_screen.dart';
import 'package:esnafpanel_mobile/screens/customer/customer_management_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';
import 'theme/theme_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
      ],
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
      title: 'EsnafPanel',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/registerContinue': (context) => const RegisterContinueScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/mainPanel': (context) => const MainPanelScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/security': (context) => const SecurityScreen(),
        '/help': (context) => const HelpScreen(),
        '/theme': (context) => const ThemeScreen(),
        '/order': (context) => const OrderAppointmentScreen(),
        '/customers': (context) => const CustomerManagementScreen(),
      },
    );
  }
}
