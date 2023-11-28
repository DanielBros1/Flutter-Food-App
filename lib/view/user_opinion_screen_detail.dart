import 'package:flutter/material.dart';

import '../data/models/user_opinion.dart';
import 'widgets/rating_stars.dart';


class UserOpinionDetailScreen extends StatelessWidget {
  final UserOpinion opinion;

  const UserOpinionDetailScreen({Key? key, required this.opinion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: const Text('Opinion Details'),
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.brown.shade50,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User Opinion',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CircleAvatar(
                  backgroundImage: NetworkImage(opinion.userAvatar),
                  radius: 40,
                ),
                const SizedBox(height: 16),
                Text(
                  opinion.userName,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                RatingStars(rating: opinion.rating),
                const SizedBox(height: 8),
                Text('Date: ${opinion.date}'),
                const SizedBox(height: 16),
                const Text(
                  'Comment:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(opinion.comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
