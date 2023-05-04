import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/home/widgets/categories_widget.dart';
import 'package:ecommerce/presentation/screens/home/widgets/merchants_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/default_element.dart';
import '../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'widgets/banners_widget.dart';
import 'widgets/hotselling_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          BannerWidget(),
          CategoriesWidget(),
          DefaultLabel(text: AppStrings.hotSelling),
          HotSellingWidget(),
          DefaultLabel(text: AppStrings.merchants),
          AllMerchantsWidget(),
        ],
      ),
    );
  }
}
