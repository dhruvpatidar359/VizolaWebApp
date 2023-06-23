class CardModel {
  final String title;
  final String description;
  final int contributorCount;
  final int storiesCount;
  final String docId;

  CardModel({
    required this.title,
    required this.description,
    required this.contributorCount,
    required this.storiesCount,
    required this.docId,
  });
}
