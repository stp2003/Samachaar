import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:samachaar/model/slider_model.dart';
import 'package:samachaar/services/category_data.dart';
import 'package:samachaar/services/slider_data.dart';
import 'package:samachaar/widgets/app_bar.dart';
import 'package:samachaar/widgets/build_image.dart';
import 'package:samachaar/widgets/build_indicator.dart';

import '../model/category_model.dart';
import '../widgets/category_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];

  int activeIndex = 0;

  //?? init
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
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
      body: Padding(
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
                    onTap: () {},
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
            CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder: (context, index, realIndex) {
                String? img = sliders[index].image;
                String? name = sliders[index].name;
                return BuildImage(image: img!, index: index, name: name!);
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
                count: sliders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
