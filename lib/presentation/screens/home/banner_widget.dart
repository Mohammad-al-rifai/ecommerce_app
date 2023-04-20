import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../app/functions.dart';
import '../../../config/urls.dart';
import '../../../domain/models/home_models/banner_model.dart';
import '../../resources/color_manager.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
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
          aspectRatio: 16 / 9,
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
