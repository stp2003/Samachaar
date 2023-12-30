import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:samachaar/model/article_model.dart';
import 'package:samachaar/model/slider_model.dart';
import 'package:samachaar/screens/all_news.dart';
import 'package:samachaar/services/category_data.dart';
import 'package:samachaar/widgets/app_bar.dart';
import 'package:samachaar/widgets/build_image.dart';
import 'package:samachaar/widgets/build_indicator.dart';
import 'package:samachaar/widgets/trending_news.dart';

import '../model/category_model.dart';
import '../services/news_dart.dart';
import '../services/slider_data.dart';
import '../widgets/category_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];

  //!!
  bool _loading = true, loading2 = true;

  int activeIndex = 0;

  //?? get news ->
  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  //?? get slider data ->
  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      loading2 = false;
    });
  }

  //?? init
  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      height: 70.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            image: categories[index].image!,
                            categoryName: categories[index].categoryName!,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Breaking News!!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              letterSpacing: 0.8,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.purple,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const AllNews(
                                    news: 'Breaking',
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "View All",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.orangeAccent,
                                color: Colors.orange,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    loading2
                        ? const Center(child: CircularProgressIndicator())
                        : CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              String? img = sliders[index].urlToImage;
                              String? name = sliders[index].title;
                              return BuildImage(
                                image: img!,
                                index: index,
                                name: name!,
                              );
                            },
                            options: CarouselOptions(
                              height: 250,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: (index, reason) {
                                setState(
                                  () {
                                    activeIndex = index;
                                  },
                                );
                              },
                            ),
                          ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: BuildIndicator(
                        activeIndex: activeIndex,
                        count: 5,
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Trending News!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                              fontSize: 18.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const AllNews(
                                    news: 'Trending',
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "View All",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.deepOrangeAccent,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return TrendingNews(
                          url: articles[index].url!,
                          desc: articles[index].description!,
                          imageUrl: articles[index].urlToImage!,
                          title: articles[index].title!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
