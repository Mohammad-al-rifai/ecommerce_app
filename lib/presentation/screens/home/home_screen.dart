import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/domain/models/home_models/banner_model.dart';
import 'package:ecommerce/presentation/components/loading.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/functions.dart';
import '../../resources/color_manager.dart';
import 'banner_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeLayoutCubit.get(context).getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          allBanners(),
        ],
      ),
    );
  }

  Widget allBanners() {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetBannersLoadingState) {
          return Center(
            child: DefaultLoading(),
          );
        }
        if (state is GetBannersDoneState) {
          return BannerWidget(
            items: state.banners
                .map(
                  (e) => getBannerItem(e),
                )
                .toList(),
          );
        }
        if (state is GetBannersErrorState) {
          return Center(
            child: MText(
              text: 'Error Banner State, Please Check Yor Internet.',
            ),
          );
        }
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageAssets.noImage,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getBannerItem(BannerItem item) {
    return Padding(
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
            image: DecorationImage(
              image: NetworkImage(Urls.filesUrl + (item.content ?? '')),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
