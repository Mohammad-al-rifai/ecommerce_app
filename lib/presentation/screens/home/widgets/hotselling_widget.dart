// Hot Selling Widget:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

import '../../../../app/functions.dart';
import '../../../../domain/models/product_models/hot_selling_model.dart';
import '../../../components/default_image.dart';
import '../../../components/error.dart';
import '../../../components/loading.dart';
import '../../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import '../../../resources/values_manager.dart';

class HotSellingWidget extends StatelessWidget {
  const HotSellingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);

        return Conditional.single(
          context: context,
          conditionBuilder: (context) => cubit.products.isNotEmpty,
          widgetBuilder: (context) {
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
                    cubit.products.length > 2 ? 2 : cubit.products.length,
                itemBuilder: (context, index) {
                  return buildProItem(cubit.products[0], context);
                },
              ),
            );
          },
          fallbackBuilder: (context) => const DefaultLoading(),
        );
      },
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
      child: DefaultImage(imageUrl: product.product!.mainImage),
    );
  }
}
