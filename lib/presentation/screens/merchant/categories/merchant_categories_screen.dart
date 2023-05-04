import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/domain/models/categories/all_categories_model.dart';
import 'package:ecommerce/presentation/components/default_image.dart';
import 'package:ecommerce/presentation/components/loading.dart';
import 'package:ecommerce/presentation/layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/shared_widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class MerchantCategoriesScreen extends StatefulWidget {
  const MerchantCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<MerchantCategoriesScreen> createState() =>
      _MerchantCategoriesScreenState();
}

class _MerchantCategoriesScreenState extends State<MerchantCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MerchantLayoutCubit, MerchantLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MerchantLayoutCubit cubit = MerchantLayoutCubit.get(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              cubit.categories.isNotEmpty ||
              state is GetMerchantCategoriesDoneState,
          widgetBuilder: (context) {
            return Padding(
              padding: const EdgeInsetsDirectional.all(AppPadding.p8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 6 / 8,
                  crossAxisSpacing: AppSize.s8,
                  mainAxisSpacing: AppSize.s8,
                ),
                itemCount: cubit.categories.length,
                itemBuilder: (context, index) {
                  return CategoryItemWidget(
                    catData: cubit.categories[index],
                  );
                },
              ),
            );
          },
          fallbackBuilder: (context) {
            return const DefaultLoading();
          },
        );
      },
    );
  }

  Widget buildCatItem(CategoryData categoryData) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.lightPrimary.withOpacity(.4),
          borderRadius: BorderRadiusDirectional.circular(AppSize.s8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: AppSize.s25,
            child: DefaultImage(imageUrl: categoryData.imageOfCate),
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          Text(
            getNameTr(
              arName: categoryData.arName,
              enName: categoryData.enName,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: getBoldStyle(color: ColorManager.darkPrimary),
          )
        ],
      ),
    );
  }
}
