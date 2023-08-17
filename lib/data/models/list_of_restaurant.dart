import 'package:flutter/material.dart';

import '../../enums/restaurant_category.dart';
import 'restaurant.dart';

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
  Restaurant(
    id: 'piza',
    name: 'The Well Stacked Pizza Co.',
    description: 'Well Stacked Pizza provide food to replenish health',
    color: Colors.deepOrangeAccent,
    imageLogoAssetPath: 'assets/img_well_stacked_pizza.png',
    imageMainAssetPath: 'assets/foto_well_stacked_pizza.png',
    restaurantCategory: RestaurantCategory.pizzeria,
  ),
  Restaurant(
    id: 'new',
    name: 'Burger Shot',
    description:
    'America\'s favorite national quick service factory farmed restaurant chain',
    restaurantCategory: RestaurantCategory.fastFood,
    color: Colors.blue,
    imageMainAssetPath: 'assets/foto_burger_shot.png',
    imageLogoAssetPath: 'assets/img_burger_shot.png',
  ),
];