import 'package:flutter/material.dart';

import '../data/models/restaurant.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final Restaurant restaurant;

  const RecommendedFoodDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey.shade200,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                //todo add restaurant to favourite restaurant
                //todo przy 3 zamownieniach w tej samej restauracji --> propozycja dodania restauranji do ulubionych
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey.shade200,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //         color: Colors.white,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                  child: Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),

            /// pinned = true => appBar will remain pinned at the top of the viewport while user scrolls thought the content below it
            pinned: true,
            // This will be main color of the restaurant
            backgroundColor: Colors.yellowAccent.shade100,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                restaurant.imageMainAssetPath ?? 'assets/foto_cluckin_bell.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text("""Here's an explanation of this line of code:

                    FirebaseAuth.instance: This part accesses the singleton instance of the FirebaseAuth class. FirebaseAuth is the main class provided by the firebase_auth package that manages Firebase Authentication in your Flutter app.

                        .authStateChanges(): This is a method provided by FirebaseAuth that returns a stream of authentication state changes. The stream emits events whenever a user signs in, signs out, or when the authentication state changes in any way.

          In your code, this stream is used within a StreamBuilder widget. The StreamBuilder listens to the stream returned by authStateChanges() and rebuilds its child widgets whenever the authentication state changes. It takes two important parameters:

    stream: This is the stream that the StreamBuilder listens to for events, which, in this case, are changes in the authentication state.

        builder: This is a callback function that gets called whenever there is a new event on the stream (i.e., when the authentication state changes). It receives two arguments: the context and a snapshot.

    context: This is the current build context.

    snapshot: This is an object that contains the most recent data emitted by the stream.
Here's an explanation of this line of code:

FirebaseAuth.instance: This part accesses the singleton instance of the FirebaseAuth class. FirebaseAuth is the main class provided by the firebase_auth package that manages Firebase Authentication in your Flutter app.

.authStateChanges(): This is a method provided by FirebaseAuth that returns a stream of authentication state changes. The stream emits events whenever a user signs in, signs out, or when the authentication state changes in any way.

In your code, this stream is used within a StreamBuilder widget. The StreamBuilder listens to the stream returned by authStateChanges() and rebuilds its child widgets whenever the authentication state changes. It takes two important parameters:

stream: This is the stream that the StreamBuilder listens to for events, which, in this case, are changes in the authentication state.

builder: This is a callback function that gets called whenever there is a new event on the stream (i.e., when the authentication state changes). It receives two arguments: the context and a snapshot.

context: This is the current build context.

snapshot: This is an object that contains the most recent data emitted by the stream.

In the builder callback, the code checks the snapshot to determine whether there is user authentication data (snapshot.hasData). If there is user data, it returns a HomePage widget, indicating that the user is signed in. If there is no user data (i.e., snapshot.hasData is false), it returns a LoginPage widget, indicating that the user is not signed in.

In summary, the line of code you asked about sets up a stream that listens for changes in the user's authentication state and uses a StreamBuilder to conditionally build different UI components based on whether the user is authenticated or not.
    In the builder callback, the code checks the snapshot to determine whether there is user authentication data (snapshot.hasData). If there is user data, it returns a HomePage widget, indicating that the user is signed in. If there is no user data (i.e., snapshot.hasData is false), it returns a LoginPage widget, indicating that the user is not signed in.

    In summary, the line of code you asked about sets up a stream that listens for changes in the user's authentication state and uses a StreamBuilder to conditionally build different UI components based on whether the user is authenticated or not."""),
              )
            ],
          )
              //          Text(
              //             'The Well Stacked Pizza Co. is a parody of Pizza Hut, although its logo is similar to Domino\'s Pizza, as well as the name itself possibly referring to the stacking nature of dominoes. Like many food-related businesses, Well Stacked Pizza provide food to replenish health in Grand Theft Auto: Vice City and Grand Theft Auto: San Andreas, but are not accessible in Grand Theft Auto: Vice City Stories. The name is a term for a woman with large breasts: "well stacked". In Grand Theft Auto: San Andreas, many of the pedestrian customers that spawn in the pizzeria are usually seen eating pizza; the player can also go behind the counter to where a Fire Extinguisher pickup may be found in the kitchen. Pizza Boy delivery scooters owned by the chain are obtainable in both Grand Theft Auto: Vice City and Grand Theft Auto: San Andreas. Pizza Boy is a Grand Theft Auto: Vice City side mission begin when boarding the scooter outside any Well Stacked delivery window. Successful completion of level 10 returning to the window rewards \$5000, increases maximum health 50 points to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success. to 150 and is required for achieving 100% Completion (a software glitch then prevents the scooter from spawning at the Vercetti Estate after mission success.'),
              ),
        ],
      ),
    );
  }
}
