import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class ListNotifier extends ValueNotifier<List<Restaurant>> {
  ListNotifier(super.value);
}