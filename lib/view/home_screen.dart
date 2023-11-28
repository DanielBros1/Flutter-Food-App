import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/models/restaurant.dart';
import '../data/providers/list_notifier.dart';
import 'widgets/home_screen/category_button.dart';
import 'widgets/home_screen/my_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.listNotifier});

  final int spaceInFloatingButton = 10;
  final ListNotifier listNotifier;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '';
  double distanceValue = 50;
  bool isFavoriteHovering = false;
  bool isSearchHovering = false;
  bool isLogoutHovering = false;

  @override
  Widget build(BuildContext context) {
    List<Restaurant> filteredRestaurants = widget.listNotifier.value;


    if (selectedCategory == 'all') {
      filteredRestaurants = widget.listNotifier.value.toList();
    } else {
      if (selectedCategory.isNotEmpty) {
        filteredRestaurants = widget.listNotifier.value
            .where((restaurant) =>
                restaurant.restaurantCategory.name == selectedCategory)
            .toList();
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isFavoriteHovering = true;
              });
            },
            onExit: (_) {
              setState(() {
                isFavoriteHovering = false;
              });
            },
            // Favorite restaurants
            child: IconButton(
              onPressed: () {},
              icon: isFavoriteHovering
                  ? const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.red.shade300,
                    ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isSearchHovering = true;
              });
            },
            onExit: (_) {
              setState(() {
                isSearchHovering = false;
              });
            },
            child: IconButton(
              onPressed: () {},
              icon: isSearchHovering
                  ? const Icon(
                      Icons.saved_search_sharp,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.search,
                      color: Colors.blue.shade600,
                    ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              AwesomeDialog(
                      context: context,
                      dialogBackgroundColor: Colors.blueGrey.shade200,
                      dialogType: DialogType.question,
                      animType: AnimType.topSlide,
                      title: 'Logout?',
                      desc: 'Are you sure you want to log out?',
                      btnCancelText: 'Cancel',
                      btnOkText: 'Logout',
                      btnCancelOnPress: () {
                      },
                      btnOkOnPress: () {
                        FirebaseAuth.instance.signOut();
                      },
                      btnCancelColor: Colors.blueGrey,
                      btnOkColor: Colors.redAccent)
                  .show();
            },
          ),
        ],
        title: const Text('Search your restaurant'),
        toolbarOpacity: 0.7,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
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
      floatingActionButton: floatingActionButtonScreen(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  FloatingActionButton floatingActionButtonScreen(BuildContext context) {
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                // color: Colors.blueGrey.shade500,
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Still in progress...",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              );
            });
      },
      backgroundColor: Colors.blueGrey.shade400,
      child: const Icon(Icons.search_rounded),
    );
  }
}
