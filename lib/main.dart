import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_gta/Item.dart';

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
  ),
  Restaurant(
    id: 'IQ',
    name: 'Bean Machine',
    description: 'One of the cafeteria in Los Santos',
    color: Colors.brown,
    imageMainAssetPath: 'assets/foto_bean_machine.png',
    imageLogoAssetPath: 'assets/img_bean_machine.png',
  ),
  Restaurant(
    id: 'ads',
    name: 'Cluckin Bell',
    description: 'Simply the Best',
    color: Colors.deepOrangeAccent,
    imageMainAssetPath: 'assets/foto_cluckin_bell.png',
    imageLogoAssetPath: 'assets/img_cluckin_bell.png',
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.listNotifier});

  final ListNotifier listNotifier;

  @override
  Widget build(BuildContext context) {
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryButton(text: 'Pizzeria'),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryButton(text: 'Coffee Shop'),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryButton(text: 'Fast Food'),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryButton(text: 'Seafood Restaurant'),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryButton(text: 'Chinese Restaurant'),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryButton(text: 'Vegan Restaurant'),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryButton(text: 'Sushi Bar'),
                ],
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
              child: ValueListenableBuilder(
                valueListenable: listNotifier,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyListTile(
                        restaurant: value[index],
                        listNotifier: listNotifier,
                      ),
                    ),
                  );
                },
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

  const CategoryButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle category button press
      },
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
            widget.restaurant.imageMainAssetPath ?? 'assets/foto_cluckin_bell.png',
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

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    this.color = Colors.lightGreen,
    this.imageMainAssetPath,
    this.imageLogoAssetPath,
  });
}
