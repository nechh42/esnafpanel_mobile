import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:esnafpanel_mobile/main.dart';
import 'package:esnafpanel_mobile/firebase/firebase_options.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    // Firebase başlat
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await tester.pumpWidget(const EsnafPanelApp());

    // SplashScreen'de CircularProgressIndicator var mı?
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
