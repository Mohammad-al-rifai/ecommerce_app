import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/domain/models/auth_models/merchants_model.dart';
import 'package:ecommerce/presentation/components/loading.dart';
import 'package:ecommerce/presentation/layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecommerce/presentation/screens/home/widgets/view_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../../components/default_image.dart';
import '../../../layouts/merchant_layout/merchant_layout.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class AllMerchantsWidget extends StatelessWidget {
  const AllMerchantsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);

        return Conditional.single(
          context: context,
          conditionBuilder: (context) => cubit.merchants.isNotEmpty,
          widgetBuilder: (context) {
            return SizedBox(
              height: AppSize.s60,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildMerchantItem(
                          context,
                          user: cubit.merchants[index],
                        );
                      },
                      itemCount: cubit.merchants.length,
                    ),
                  ),
                  ViewAllWidget(onTap: () {}),
                ],
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

  Widget buildMerchantItem(context, {MerchantUser? user}) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 4.0,
      ),
      child: GestureDetector(
        onTap: () {
          navigateTo(
            context,
            MerchantLayout(
              merchantUser: user,
            ),
          );
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s30),
            color: ColorManager.primary,
          ),
          child: CircleAvatar(
            radius: AppSize.s30,
            child: DefaultImage(
              imageUrl: user?.marketLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
