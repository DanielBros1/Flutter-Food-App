import 'package:flutter/material.dart';


class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) {
          if (index < rating.floor()) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          } else if (index == rating.floor() && rating % 1 != 0) {
            return const Icon(
              Icons.star_half,
              color: Colors.amber,
            );
          } else {
            return const Icon(
              Icons.star_border,
              color: Colors.amber,
            );
          }
        },
      ),
    );
  }
}
