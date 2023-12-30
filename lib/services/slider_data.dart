import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samachaar/constant/api_key.dart';

import '../model/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach(
        (element) {
          if (element["urlToImage"] != null && element['description'] != null) {
            SliderModel sliderModel = SliderModel(
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              author: element["author"],
            );
            sliders.add(sliderModel);
          }
        },
      );
    }
  }
}
