import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samachaar/constant/api_key.dart';

import '../model/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach(
        (element) {
          if (element["urlToImage"] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              author: element["author"],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}
