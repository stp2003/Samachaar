import 'package:flutter/material.dart';

import '../model/article_model.dart';
import '../model/slider_model.dart';
import '../services/news_dart.dart';
import '../services/slider_data.dart';
import '../widgets/all_news_section.dart';

class AllNews extends StatefulWidget {
  final String news;

  const AllNews({
    super.key,
    required this.news,
  });

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];

  //?? init ->
  @override
  void initState() {
    getSlider();
    getNews();
    super.initState();
  }

  //?? get news ->
  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {});
  }

  //?? get slider news ->
  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.news} News",
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount:
              widget.news == "Breaking" ? sliders.length : articles.length,
          itemBuilder: (context, index) {
            print(articles.length);
            print(sliders.length);
            return AllNewsSection(
              image: widget.news == "Breaking"
                  ? sliders[index].urlToImage!
                  : articles[index].urlToImage!,
              desc: widget.news == "Breaking"
                  ? sliders[index].description!
                  : articles[index].description!,
              title: widget.news == "Breaking"
                  ? sliders[index].title!
                  : articles[index].title!,
              url: widget.news == "Breaking"
                  ? sliders[index].url!
                  : articles[index].url!,
            );
          },
        ),
      ),
    );
  }
}
