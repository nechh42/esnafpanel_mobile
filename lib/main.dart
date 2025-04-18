import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase/firebase_options.dart';
import 'providers/theme_provider.dart';
import 'theme/app_theme.dart';

import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_continue_screen.dart';
import 'screens/subscription/subscription_screen.dart';
import 'screens/payment/payment_screen.dart';
import 'screens/main_panel/main_panel_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/profile_edit_screen.dart';
import 'screens/security/security_screen.dart';
import 'theme/theme_screen.dart';

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
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'EsnafPanel',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/register-continue': (context) => const RegisterContinueScreen(),
              '/subscription': (context) => const SubscriptionScreen(),
              '/payment': (context) => const PaymentScreen(),
              '/main_panel': (context) => const MainPanelScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/security': (context) => const SecurityScreen(),
              '/profile_edit': (context) => const ProfileEditScreen(),
              '/theme': (context) => const ThemeScreen(),
            },
          );
        },
      ),
    );
  }
}
