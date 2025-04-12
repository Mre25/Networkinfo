class Article {
  final String id;
  final String title;
  final String content;
  final String category;

  Article({
    required this.id,
    required this.title,
    required this.content,
    this.category = 'عام',
  });
}
