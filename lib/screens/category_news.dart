import 'package:flutter/material.dart';

import '../model/show_category_model.dart';
import '../services/category_news_data.dart';
import '../widgets/show_category.dart';

class CategoryNews extends StatefulWidget {
  final String name;

  const CategoryNews({
    super.key,
    required this.name,
  });

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
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
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ShowCategory(
              image: categories[index].urlToImage!,
              desc: categories[index].description!,
              title: categories[index].title!,
              url: categories[index].url!,
            );
          },
        ),
      ),
    );
  }
}
