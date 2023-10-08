import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_gta/auth/auth_page.dart';
import 'package:food_ordering_gta/data/models/list_of_restaurant.dart';
import 'package:food_ordering_gta/data/providers/list_notifier.dart';
import 'package:food_ordering_gta/view/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //todo Main_screen nie jest sprawdzony, ani wytestowany, nalezy utworzyc konto w firebase
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          debugPrint('check if snapshot has a data');
          if (snapshot.hasData) {
            debugPrint('snapshot has data');
            return HomeScreen(listNotifier: ListNotifier(listOfRestaurant));
          } else {
            debugPrint('snapshot has no data');
            return AuthPage();
          }
        },
      ),
    );
  }
}
