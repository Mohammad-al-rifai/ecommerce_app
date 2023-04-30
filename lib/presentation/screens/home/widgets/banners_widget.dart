import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/functions.dart';
import '../../../../config/urls.dart';
import '../../../../domain/models/home_models/banner_model.dart';
import '../../../components/default_carousal_slider.dart';
import '../../../components/error.dart';
import '../../../components/loading.dart';
import '../../../components/my_text.dart';
import '../../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';

Widget allBanners(context) {
  return BlocProvider(
    create: (context) => HomeLayoutCubit()..getBanners(),
    child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
        if (state is GetBannersLoadingState) {
          return Center(
            child: DefaultCarousalWidget(
              items: [
                getBannerItem(context: context),
              ],
            ),
          );
        }
        if (state is GetBannersDoneState) {
          return DefaultCarousalWidget(
            items: state.banners
                .map(
                  (e) => getBannerItem(item: e, context: context),
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
    ),
  );
}

Widget getBannerItem({BannerItem? item, context}) {
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
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: ColorManager.primary.withOpacity(.7),
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              Urls.filesUrl + (item?.content ?? ''),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
