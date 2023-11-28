import 'package:flutter/material.dart';
import 'package:food_ordering_gta/data/models/user_opinion.dart';

import '../data/firebase/user_opinions_download.dart';
import 'add_user_opinion_screen.dart';
import 'user_opinion_screen_detail.dart';
import 'widgets/limited_text.dart';
import 'widgets/rating_stars.dart';



class UserOpinionsScreen extends StatefulWidget {
  const UserOpinionsScreen({super.key, required this.id});

  final String id;

  @override
  State<UserOpinionsScreen> createState() => _UserOpinionsScreenState();
}

class _UserOpinionsScreenState extends State<UserOpinionsScreen> {

  late Future<List<UserOpinion>> userOpinionsFuture;
  @override
  void initState() {
    super.initState();
    userOpinionsFuture = fetchUserOpinionsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Actually restaurant id is: ${widget.id}');

   // List<UserOpinion> userOpinions =
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        title: Text('User Opinions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<UserOpinion>>(
          future: userOpinionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the data is still loading
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If there is an error fetching the data
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<UserOpinion> userOpinions = snapshot.data!;

              debugPrint('Before filtering:');
              for (var opinion in userOpinions) {
                debugPrint('For opinionID: ${opinion.id} restaurantID: ${opinion.restaurantId}');
              }
              // Filter userOpinion by restaurantID
              userOpinions = userOpinions.where((userOpinion) => userOpinion.restaurantId == widget.id).toList();

              debugPrint('After filtering:');
              for (var opinion in userOpinions) {
                debugPrint('For opinionID: ${opinion.id} restaurantID: ${opinion.restaurantId}');
              }
              return Column(
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
                                LimitedText(
                                  text: opinion.comment,
                                  maxLength: 200,
                                ),
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
                  SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddUserOpinionScreen(restaurantId: widget.id),
                            ),
                        );
                      },
                      child: Text('Add Opinion'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.3, 60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
