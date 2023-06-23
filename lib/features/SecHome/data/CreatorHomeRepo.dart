import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webapp/features/SecHome/data/CardModel.dart';

class CreatorHomeRepositry {
  static final CreatorHomeRepositry _singleton =
      CreatorHomeRepositry._internal();

  factory CreatorHomeRepositry() {
    return _singleton;
  }

  CreatorHomeRepositry._internal();

  Future<List<CardModel>> fetchCards(String className) async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(className).get();
    final List<CardModel> cards = [];

    if (snapshot.docs.isNotEmpty) {
      for (final doc in snapshot.docs) {
        final card = CardModel(
            title: doc['title'],
            description: doc['description'],
            contributorCount: doc['contributorCount'],
            storiesCount: doc['storiesCount'],
            docId: doc.id);
        cards.add(card);
      }
    }
    return cards;
  }
}
