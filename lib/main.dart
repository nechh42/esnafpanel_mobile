import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:esnafpanel_mobile/firebase_options.dart';

// Ekranlar
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_continue_screen.dart';
import 'screens/subscription/subscription_screen.dart';
import 'screens/subscription/payment_screen.dart';
import 'screens/main_panel/main_panel_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/security/security_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const EsnafPanelApp());
}

class EsnafPanelApp extends StatelessWidget {
  const EsnafPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EsnafPanel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register_continue': (context) => const RegisterContinueScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/main_panel': (context) => const MainPanelScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/security': (context) => const SecurityScreen(),
      },
    );
  }
}
