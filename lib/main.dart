import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esnafpanel_mobile/providers/theme_provider.dart';
import 'package:esnafpanel_mobile/screens/splash/splash_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/settings_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/profile_edit_screen.dart';
import 'package:esnafpanel_mobile/screens/security/security_screen.dart';
import 'package:esnafpanel_mobile/screens/settings/theme_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile_edit': (context) => const ProfileEditScreen(),
        '/theme': (context) => const ThemeScreen(),
        '/security': (context) => const SecurityScreen(),
      },
    );
  }
}
