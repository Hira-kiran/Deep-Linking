import 'package:deep_linking/firebase_options.dart';
import 'package:deep_linking/screens/blue_screen.dart';
import 'package:deep_linking/screens/green_screen.dart';
import 'package:deep_linking/screens/pink_screen.dart';
import 'package:deep_linking/screens/red_screen.dart';
import 'package:deep_linking/services/context_utility.dart';
import 'package:deep_linking/services/uni_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  UniServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const BlueScreen(),
        '/green': (context) => const GreenScreen(),
        '/red': (context) => const RedScreen(),
        '/pink': (context) => const PinkScreen(),
      },
    );
  }
}

// ---------- https://deep-linking-3d7c2.web.app
