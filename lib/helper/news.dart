import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=04e30378eb99432fae48ba223774598f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      var arr = jsonData['articles'];
      for (var index in arr) {
        if (index["urlToImage"] != null && index["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: index['title'],
              author: index['author'],
              description: index['description'],
              url: index['url'],
              urlToImage: index['urlToImage'],
              content: index['content']);

          news.add(articleModel);
        }
      }
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=04e30378eb99432fae48ba223774598f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      var arr = jsonData['articles'];
      for (var index in arr) {
        if (index["urlToImage"] != null && index["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: index['title'],
              author: index['author'],
              description: index['description'],
              url: index['url'],
              urlToImage: index['urlToImage'],
              content: index['content']);

          news.add(articleModel);
        }
      }
    }
  }
}
