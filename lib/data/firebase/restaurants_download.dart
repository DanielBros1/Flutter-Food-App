import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../enums/restaurant_category.dart';
import '../models/restaurant.dart';

// upload list_of_restaurant from Firestore Database
Future<List<Restaurant>> fetchRestaurantsFromFirestore() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('restaurants').get();

  return snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Restaurant(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      color: Color(data['color']), // Assuming color is stored as a number
      imageMainAssetPath: data['imageMainPath'] ?? '',
      imageLogoAssetPath: data['imageLogoPath'] ?? '',
      restaurantCategory: RestaurantCategory.values.firstWhere(
            (e) => e.toString() == data['restaurantCategory'],
        orElse: () => RestaurantCategory.other,
      ),
      deliveryCost: (data['deliveryCost'] ?? 0.0),
      estimatedTime: (data['estimatedTime'] ?? 0.0),
      minimumOrderValue: (data['minimumOrderValue'] ?? 0.0),
    );
  }).toList();
}

var listOfRestaurant = fetchRestaurantsFromFirestore();
