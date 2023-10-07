import 'package:flutter/material.dart';
import 'package:food_ordering_gta/auth/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future <void> main() async {
  // to initialize a Firebase before runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
  home: AuthPage(),
 //     home: HomeScreen(
 //       listNotifier: ListNotifier(listOfRestaurant),
 //     ),
    );
  }
}
