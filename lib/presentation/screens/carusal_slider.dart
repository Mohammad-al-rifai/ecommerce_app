import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

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
        items: [
          getContainer(context),
          getContainer(context),
          getContainer(context),
        ],
      );

  getContainer(context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: DottedBorder(
          color: ColorManager.error,
          strokeWidth: 1.3,
          borderType: BorderType.RRect,
          radius: const Radius.circular(16.0),
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: getScreenWidth(context),
            decoration: BoxDecoration(
              color: ColorManager.primary.withOpacity(.7),
              borderRadius: BorderRadius.circular(16.0),
              image: const DecorationImage(
                image:
                    NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Image 3',
                    style: TextStyle(fontSize: 32, color: Colors.white)),
                SizedBox(height: 16),
                Text('Description for Image 3',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
        ),
      );
}
