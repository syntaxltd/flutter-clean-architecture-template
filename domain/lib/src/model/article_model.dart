class ArticleModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String date;

  ArticleModel({required this.id, required this.title, required this.description, required this.imageUrl, required this.articleUrl, required this.date});

  @override
  String toString() => 'ArticleModel({id: $id, title: $title, description: $description, imageUrl: $imageUrl, articleUrl: $articleUrl, date: $date})';
}
