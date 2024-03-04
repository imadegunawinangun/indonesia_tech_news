import 'package:indonesia_tech_news/features/dialy_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel(
      {id, author, title, description, url, urlToImage, publishedAt, content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);

  }
}
