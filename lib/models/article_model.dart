class ArticleModel {
  late String urlToImage;
  late String title;
  late String description;
  late String url;
  late String? content;
  late String? author;

  ArticleModel({
    required this.urlToImage,
    required this.title,
    required this.description,
    required this.url,
    this.content,
    this.author,
  });
}
