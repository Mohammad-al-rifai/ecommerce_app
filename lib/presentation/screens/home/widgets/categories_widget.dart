import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/functions.dart';
import '../../../../config/urls.dart';
import '../../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';

Widget categoriesWidget() {
  return BlocProvider(
    create: (context) => HomeLayoutCubit()..getCategories(),
    child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
        if (state is GetCategoriesDoneState) {
          return SizedBox(
            height: AppSize.s60,
            child: Row(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemExtent: AppSize.s60,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 4.0,
                      ),
                      child: CircleAvatar(
                        backgroundColor: ColorManager.primary,
                        backgroundImage: CachedNetworkImageProvider(
                          Urls.filesUrl +
                              (state.categories?[index].imageOfCate ?? ''),
                        ),
                        child: MText(
                          text: getNameTr(
                            arName: state.categories?[index].arName,
                            enName: state.categories?[index].enName,
                          ),
                          color: ColorManager.darkPrimary,
                        ),
                      ),
                    );
                  },
                  itemCount: state.categories?.length ?? 2,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: AppPadding.p8,
                    start: AppPadding.p4,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      cubit.changeBottom(1);
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorManager.primary,
                      radius: 25.0,
                      child: MText(
                        text: AppStrings.showAll,
                        color: ColorManager.white,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is GetCategoriesLoadingState) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 4.0,
            ),
            child: CircleAvatar(
              backgroundColor: ColorManager.primary,
              child: MText(
                text: 'noName',
                color: ColorManager.white,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    ),
  );
}
