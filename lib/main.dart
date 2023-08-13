import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var listOfRestaurant = [
  Restaurant(
    id: 'Unique ID',
    name: 'Pizza this',
    description: 'The best pizzeria in Los Santos',
    color: Colors.red,
    imageMainAssetPath: 'assets/foto_pizza_this.png',
    imageLogoAssetPath: 'assets/img_pizza_this.png',
    restaurantCategory: RestaurantCategory.pizzeria,
  ),
  Restaurant(
    id: 'IQ',
    name: 'Bean Machine',
    description: 'One of the cafeteria in Los Santos',
    color: Colors.brown,
    imageMainAssetPath: 'assets/foto_bean_machine.png',
    imageLogoAssetPath: 'assets/img_bean_machine.png',
    restaurantCategory: RestaurantCategory.coffeeShop,
  ),
  Restaurant(
    id: 'ads',
    name: 'Cluckin Bell',
    description: 'Simply the Best',
    color: Colors.deepOrangeAccent,
    imageMainAssetPath: 'assets/foto_cluckin_bell.png',
    imageLogoAssetPath: 'assets/img_cluckin_bell.png',
    restaurantCategory: RestaurantCategory.fastFood,
  ),
  Restaurant(
    id: 'sds',
    name: 'Super Star Cafe',
    description: 'Coffee for everyone',
    color: Colors.brown.shade300,
    imageMainAssetPath: 'assets/foto_super_star_cafe.png',
    imageLogoAssetPath: 'assets/img_super_star_cafe.png',
    restaurantCategory: RestaurantCategory.coffeeShop,
  ),
];

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
      home: MainScreen(
        listNotifier: ListNotifier(listOfRestaurant),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.listNotifier});

  final ListNotifier listNotifier;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    List<Restaurant> filteredRestaurants = widget.listNotifier.value;


    for (var restaurant in filteredRestaurants) {
      debugPrint('Restaurant: ${restaurant.name}, Category: ${restaurant.restaurantCategory}');
    }

    debugPrint('Selected Category: $selectedCategory');

    if (selectedCategory == 'all') {
     filteredRestaurants = widget.listNotifier.value.toList();
    }
    else {
      if (selectedCategory.isNotEmpty) {
        debugPrint('Is not empty');
        //  debugPrint('W: ${}');
        filteredRestaurants = widget.listNotifier.value
            .where(
                (restaurant) =>
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
                        }
                    ),
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
            /*         Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: CategoryButton(text: 'Category 1'),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: CategoryButton(text: 'Category 2'),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: CategoryButton(text: 'Category 3'),
                ),

              ],
            ), */
            // Box between Category and ListBuilder widgets
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
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CategoryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class MyListTile extends StatefulWidget {
  final Restaurant restaurant;
  final ListNotifier listNotifier;

  const MyListTile({
    Key? key,
    required this.restaurant,
    required this.listNotifier,
  }) : super(key: key);

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        //  borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Image.asset(
            widget.restaurant.imageMainAssetPath ??
                'assets/foto_cluckin_bell.png',
            fit: BoxFit.cover,
          ),
          ColoredBox(
            color: Colors.white10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                //   borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Rating: 4.5'),
                        Icon(
                          Icons.star_border_purple500_rounded,
                          color: CupertinoColors.systemYellow,
                        ),
                      ],
                    ),
                    Text(widget.restaurant.description ?? 'No description'),
                    Row(
                      children: [
                        Tooltip(
                          message: 'Estimated time',
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text('25 min'),
                        SizedBox(
                          width: 10,
                        ),
                        Tooltip(
                          // if delivery costs == 0, change icon color
                          message: 'Delivery cost',
                          child: Icon(
                            Icons.delivery_dining_outlined,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text('2\$'),
                        SizedBox(
                          width: 10,
                        ),
                        Tooltip(
                          message: 'Minumum order value',
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text('min. 5\$'),
                      ],
                    ),
                  ],
                ),
                trailing: ClipOval(
                  //     child: Align(
                  //        alignment: Alignment.centerRight,
                  child: Image.asset(
                    widget.restaurant.imageLogoAssetPath ??
                        'assets/img_pizza_this.png',
                    //  width: 34,
                    //  height: 34,
                    //    ),
                  ),
                ),
                hoverColor: Colors.deepOrangeAccent,
                focusColor: Colors.deepOrange,
                tileColor: Colors.white,
                style: ListTileStyle.list,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListNotifier extends ValueNotifier<List<Restaurant>> {
  ListNotifier(super.value);
}

class Restaurant {
  final String id;
  final String name;
  final String? description;
  final Color? color; //check if null-aware is necessary
  final String? imageMainAssetPath;
  final String? imageLogoAssetPath;
  final RestaurantCategory restaurantCategory;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.restaurantCategory,
    this.color = Colors.lightGreen,
    this.imageMainAssetPath,
    this.imageLogoAssetPath,
  });
}

enum RestaurantCategory {
  all,
  pizzeria,
  coffeeShop,
  fastFood,
  seafoodRestaurant,
  chineseRestaurant,
  veganRestaurant,
  sushiBar,
  other,
}
