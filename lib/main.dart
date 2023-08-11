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
        child: ValueListenableBuilder(
          valueListenable: listNotifier,
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyListTile(
                        restaurant: value[index],
                        listNotifier: listNotifier,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle:
                    Text(widget.restaurant.description ?? 'No description'),
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
