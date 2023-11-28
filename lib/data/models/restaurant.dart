import 'package:flutter/material.dart';

import '../../enums/restaurant_category.dart';

class Restaurant {
  final String id;
  final String name;
  final String? description;
  final Color? color; //check if null-aware is necessary
  final String? imageMainAssetPath;
  final String? imageLogoAssetPath;
  final RestaurantCategory restaurantCategory;
  final double? deliveryCost;
  final double? estimatedTime;
  final double? minimumOrderValue;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.restaurantCategory,
    this.color = Colors.lightGreen,
    this.imageMainAssetPath,
    this.imageLogoAssetPath,
    this.deliveryCost,
    this.estimatedTime,
    this.minimumOrderValue,
  });
}