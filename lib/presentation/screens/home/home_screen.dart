import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/categories_widget.dart';
import 'package:ecommerce/presentation/screens/home/widgets/merchants_widget.dart';
import 'package:flutter/material.dart';

import '../../components/default_element.dart';
import 'widgets/banners_widget.dart';
import 'widgets/hotselling_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          allBanners(context),
          const DefaultLabel(text: AppStrings.categories),
          categoriesWidget(),
          const DefaultLabel(text: AppStrings.hotSelling),
          getHotSelling(context),
          const DefaultLabel(text: AppStrings.merchants),
          allMerchants(),
        ],
      ),
    );
  }
}
