import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/restaurant.dart';
import '../../../data/providers/list_notifier.dart';
import '../../recommended_food_detail.dart';
import '../../user_opinions_screen.dart';

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
    return GestureDetector(
      onTap: () {
        debugPrint('${widget.restaurant}');
        print('Clicked');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendedFoodDetail(
              restaurant: widget.restaurant,
            ),
          ),
        );
      },
      child: Container(
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
                  // default Padding was set on left: 16.0 and right: 24.0
                  contentPadding: EdgeInsets.only(left: 12.0, right: 10.0),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserOpinionsScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            Tooltip(
                              message: 'See user reviews',
                              child: Text(
                                'Rating: 4.5',
                              ),
                            ),
                            Icon(
                              Icons.star_border_purple500_rounded,
                              color: CupertinoColors.systemYellow,
                            ),
                          ],
                        ),
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
      ),
    );
  }
}

