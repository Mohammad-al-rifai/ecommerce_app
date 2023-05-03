import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DefaultCarousalWidget extends StatelessWidget {
  const DefaultCarousalWidget({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return getCarousalSlider(context);
  }

  getCarousalSlider(context) => CarouselSlider(
        options: CarouselOptions(
          // height: 200,
          aspectRatio: 16 / 8,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            // Do something here
          },
          scrollDirection: Axis.horizontal,
        ),
        items: items,
      );
}
