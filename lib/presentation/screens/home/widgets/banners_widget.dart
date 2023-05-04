import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/presentation/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

import '../../../../app/functions.dart';
import '../../../../domain/models/home_models/banner_model.dart';
import '../../../components/default_carousal_slider.dart';

import '../../../components/default_image.dart';
import '../../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import '../../../resources/color_manager.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              cubit.bannersModel.data?.banners != null,
          widgetBuilder: (context) {
            return DefaultCarousalWidget(
              items: cubit.bannersModel.data!.banners!
                  .map(
                    (e) => getBannerItem(item: e, context: context),
                  )
                  .toList(),
            );
          },
          fallbackBuilder: (context) {
            return const DefaultLoading();
          },
        );
      },
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
          ),
          child: DefaultImage(
            imageUrl: item?.content,
            clickable: true,
          ),
        ),
      ),
    );
  }
}
