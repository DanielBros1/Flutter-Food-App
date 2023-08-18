import 'package:flutter/material.dart';

import '../data/models/list_of_user_opinion.dart';
import 'user_opinion_screen_detail.dart';
import 'widgets/rating_starts.dart';

class UserOpinionsScreen extends StatelessWidget {
  const UserOpinionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        title: Text('User Opinions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Opinions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: userOpinions.length,
                itemBuilder: (context, index) {
                  final opinion = userOpinions[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(opinion.userAvatar),
                      ),
                      title: Text(opinion.userName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(opinion.date),
                          SizedBox(height: 4),
                          RatingStars(rating: opinion.rating),
                          SizedBox(height: 4),
                          Text(opinion.comment),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserOpinionDetailScreen(opinion: opinion),
                          ),
                        );
                      },
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
