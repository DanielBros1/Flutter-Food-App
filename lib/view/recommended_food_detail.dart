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
                    child: Text('Description'),
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