import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddUserOpinionScreen extends StatefulWidget {
  const AddUserOpinionScreen({Key? key, required this.restaurantId}) : super(key: key);

  final String restaurantId;
  @override
  AddUserOpinionScreenState createState() => AddUserOpinionScreenState();
}

class AddUserOpinionScreenState extends State<AddUserOpinionScreen> {
  final _commentController = TextEditingController();
  double _rating = 3.0;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: const Text('Add Your Opinion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Comment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _commentController,
              decoration: const InputDecoration(
                labelText: 'Enter your comment',
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your comment';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Rating',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            RatingBar.builder(
              glowColor: Colors.amber,
              unratedColor: Colors.grey.shade400,
              updateOnDrag: true,
              initialRating: _rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                Future<DocumentSnapshot<
                    Object?>?> documentSnapshotFuture = findUserInFirestore();
                documentSnapshotFuture.then((
                    DocumentSnapshot<Object?>? documentSnapshot) {
                  if (documentSnapshot != null) {
                    Map<String, dynamic> userData = documentSnapshot
                        .data() as Map<String, dynamic>;
                    String userFistName = userData['firstName'] ?? '';
                    String userLastName = userData['lastName'] ?? '';
                    String userName = '$userFistName $userLastName';

                    String userAvatar = userData['avatar'] ?? '';

                    DateTime now = DateTime.now();
                    String date = '${now.year}-${now.month}-${now.day}';

                    String comment = _commentController.text;
                    String restaurantId = widget.restaurantId;
                    String userId = documentSnapshot.id;

                    addOpinionToFirestore(
                      userName: userName,
                      userAvatar: userAvatar,
                      date: date,
                      rating: _rating,
                      comment: comment,
                      restaurantId: restaurantId,
                      userId: userId,
                    );

                    Navigator.pop(context);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize:
                Size(MediaQuery
                    .of(context)
                    .size
                    .width * 0.3, 60),
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              child: const Text(
                'Submit Opinion',),
            ),
          ],
        ),
      ),
    );
  }

  /** Functions to add opinion to Firestore **/

  /**
   * Match the user with the user in the Firestore database
   * and return the document snapshot
   *
   * FirebaseAuth.instance.currentUser.email returns the email of the currently logged in user
   *
   * Matching is done by comparing user email with the email field in the Firestore database
   */
  Future<DocumentSnapshot<Object?>?> findUserInFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot? documentSnapshot;

    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        documentSnapshot = querySnapshot.docs[0];
      } else {}
    });
    return documentSnapshot;
  }


  void addOpinionToFirestore({
    required String userName,
    required String userAvatar,
    required String date,
    required double rating,
    required String comment,
    required String restaurantId,
    required String userId,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('opinions').add({
        'userName': userName,
        'userAvatar': userAvatar,
        'date': date,
        'rating': rating,
        'comment': comment,
        'restaurantID': restaurantId,
        'userId': userId,
      });

      debugPrint('Opinion added to Firestore successfully!');
    } catch (e) {
      debugPrint('Error adding opinion to Firestore: $e');
    }
  }
}
