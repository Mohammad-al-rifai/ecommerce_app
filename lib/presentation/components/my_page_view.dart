import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../resources/color_manager.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({
    Key? key,
    required this.controller,
    required this.pageWidget,
    required this.itemCount,
    this.height = 200.0,
  }) : super(key: key);

  final PageController controller;
  final Widget Function(BuildContext, int) pageWidget;
  final int itemCount;
  final double? height;

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          PageView.builder(
            controller: widget.controller,
            onPageChanged: (int index) {},
            physics: const BouncingScrollPhysics(),
            itemBuilder: widget.pageWidget,
            itemCount: widget.itemCount,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: AppPadding.p8, end: AppPadding.p8),
            child: SmoothPageIndicator(
              controller: widget.controller,
              effect: ExpandingDotsEffect(
                dotColor: ColorManager.lightPrimary.withOpacity(.6),
                activeDotColor: ColorManager.darkPrimary,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 5,
                expansionFactor: 2,
              ),
              count: widget.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
