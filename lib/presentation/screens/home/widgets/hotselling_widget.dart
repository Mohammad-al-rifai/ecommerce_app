// Hot Selling Widget:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/functions.dart';
import '../../../../config/urls.dart';
import '../../../../domain/models/product_models/hot_selling_model.dart';
import '../../../components/error.dart';
import '../../../components/loading.dart';
import '../../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import '../../../resources/values_manager.dart';

Widget getHotSelling(context) {
  return BlocProvider(
    create: (context) => HomeLayoutCubit()..getHotSelling(),
    child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetHotSellingLoadingState) {
          return const DefaultLoading();
        }
        if (state is GetHotSellingErrorState) {
          return const DefaultError();
        }
        if (state is GetHotSellingDoneState) {
          return Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.p8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6 / 4,
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 3.0,
              ),
              itemCount:
                  state.products!.length > 2 ? 2 : state.products?.length,
              itemBuilder: (context, index) {
                return buildProItem(state.products![0], context);
              },
            ),
          );
        }
        return const SizedBox();
      },
    ),
  );
}

Widget buildProItem(HotSellingProduct product, context) {
  return Container(
    width: getScreenWidth(context) / 2,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: 100.0,
    decoration: getDeco(
      borderSize: 8.0,
    ),
    child: CachedNetworkImage(
      imageUrl: Urls.filesUrl + product.product!.mainImage,
      fit: BoxFit.cover,
      placeholder: (context, url) => const DefaultLoading(size: 20.0),
      errorWidget: (context, url, err) => const DefaultError(),
    ),
  );
}
