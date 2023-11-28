import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_opinion.dart';


Future<List<UserOpinion>> fetchUserOpinionsFromFirestore() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('opinions').get();

  return snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserOpinion(
      id: doc.id,
      userName: data['userName'] ?? '',
      userAvatar: data['userAvatar'] ?? '',
      date: data['date'] ?? '',
      rating: (data['rating'] ?? 0.0).toDouble(),
      comment: data['comment'] ?? '',
      restaurantId: data['restaurantID'] ?? '',
      userId: data['userID'] ?? '',
    );
  }).toList();
}
var userOpinions = fetchUserOpinionsFromFirestore();

