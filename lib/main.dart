import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/color_schemes.g.dart';
import 'package:flutter_application_coded/firebase_options.dart';
import 'package:flutter_application_coded/screens/auth_gate.dart';
import 'package:flutter_application_coded/services/service_locator.dart';
import 'package:flutter_application_coded/services/storage/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Service Locator should be first
  setupServiceLocator();

  final storageService = serviceLocator<StorageService>();
  await storageService.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: GoogleFonts.notoSansArabic().fontFamily,
        // brightness: Brightness.light,
        // primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: GoogleFonts.notoSansArabic().fontFamily,
        // brightness: Brightness.light,
        // primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}
