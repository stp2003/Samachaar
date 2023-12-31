import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildIndicator extends StatelessWidget {
  final int activeIndex;
  final int count;

  const BuildIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: const ExpandingDotsEffect(
        dotWidth: 15,
        dotHeight: 15,
        activeDotColor: Colors.orange,
      ),
    );
  }
}
