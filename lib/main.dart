import 'package:flutter/material.dart';

import 'data/models/list_of_restaurant.dart';
import 'data/models/restaurant.dart';
import 'data/providers/list_notifier.dart';
import 'view/widgets/main/category_button.dart';
import 'view/widgets/main/my_list_tile.dart';

void main() {
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
      //     home: RecommendedFoodDetail(),
      home: MainScreen(
        listNotifier: ListNotifier(listOfRestaurant),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.listNotifier});

  final int spaceInFloatingButton = 10;
  final ListNotifier listNotifier;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedCategory = '';
  double distanceValue = 50;

  @override
  Widget build(BuildContext context) {
    List<Restaurant> filteredRestaurants = widget.listNotifier.value;

    for (var restaurant in filteredRestaurants) {
      debugPrint(
          'Restaurant: ${restaurant.name}, Category: ${restaurant.restaurantCategory}');
    }

    debugPrint('Selected Category: $selectedCategory');

    if (selectedCategory == 'all') {
      filteredRestaurants = widget.listNotifier.value.toList();
    } else {
      if (selectedCategory.isNotEmpty) {
        debugPrint('Is not empty');
        //  debugPrint('W: ${}');
        filteredRestaurants = widget.listNotifier.value
            .where((restaurant) =>
                restaurant.restaurantCategory.name == selectedCategory)
            .toList();
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text('Search your restaurant'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarOpacity: 0.7,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade100,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton(
                        text: 'All',
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'all';
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Pizzeria',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'pizzeria';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Coffee Shop',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'coffeeShop';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Fast Food',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'fastFood';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Seafood Restaurant',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'seafoodRestaurant';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Chinese Restaurant',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'chineseRestaurant';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Vegan Restaurant',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'veganRestaurant';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryButton(
                      text: 'Sushi Bar',
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'sushiBar';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// Box between Category and ListBuilder widgets
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MyListTile(
                    restaurant: filteredRestaurants[index],
                    listNotifier: widget.listNotifier,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: floating_action_button(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  FloatingActionButton floating_action_button(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                // color: Colors.blueGrey.shade500,
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Distance'),
                          Slider(
                            value: distanceValue,
                            onChanged: (newValue) {
                              setState(() {
                                distanceValue = newValue;
                              });
                            },
                            min: 0,
                            max: 100,
                          ),
                        ],
                      )
                      //      Slider(value: distance, onChanged: onChanged)
                    ],
                  ),
                ),
              );
            });
      },
      backgroundColor: Colors.blueGrey.shade400,
      child: Icon(Icons.search_rounded),
    );
  }
}
