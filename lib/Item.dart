import 'package:flutter/material.dart';

@immutable
class Item {
  final int uid;
  final String name;
  final String imagePath;

  const Item({
    required this.uid,
    required this.name,
    required this.imagePath,
  });
}

List<Item> restaurants = [
  const Item(
    name: 'Cluckin Bell',
    uid: 1,
    imagePath: 'assets/img_cluckin_bell.png',
  ),
  const Item(
    name: 'Pizza this',
    uid: 2,
    imagePath: 'assets/img_pizza_this.png',
  ),
  const Item(
    name: 'Bean Machine',
    uid: 3,
    imagePath: 'assets/img_bean_machine.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 4,
    imagePath: 'assets/img_bean_machine.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 5,
    imagePath: 'assets/img_super_star_cafe.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 6,
    imagePath: 'assets/img_pizza_this.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 7,
    imagePath: 'assets/img_bean_machine.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 8,
    imagePath: 'assets/img_super_star_cafe.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 9,
    imagePath: 'assets/img_pizza_this.png',
  ),

  const Item(
    name: 'Bean Machine',
    uid: 10,
    imagePath: 'assets/img_super_star_cafe.png',
  ),
];
