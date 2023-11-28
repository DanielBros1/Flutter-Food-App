import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_gta/auth/auth_page.dart';
import 'package:food_ordering_gta/data/firebase/restaurants_download.dart';
import 'package:food_ordering_gta/data/providers/list_notifier.dart';
import 'package:food_ordering_gta/view/home_screen.dart';

import '../data/models/restaurant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Restaurant>>(
        future: fetchRestaurantsFromFirestore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Data is still being loaded
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // An error occurred
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // Data has been loaded successfully
            return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, authSnapshot) {
                if (authSnapshot.hasData) {
                  return HomeScreen(listNotifier: ListNotifier(snapshot.data!));
                } else {
                  return const AuthPage();
                }
              },
            );
          } else {
            // No data available
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
