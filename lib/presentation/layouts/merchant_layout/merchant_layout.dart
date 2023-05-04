import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/presentation/layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/auth_models/merchants_model.dart';
import '../../components/my_text.dart';
import '../../screens/merchant/categories/merchant_categories_screen.dart';
import '../../screens/merchant/offers/offers_screen.dart';
import '../../screens/merchant/products/product_screen.dart';

class MerchantLayout extends StatefulWidget {
  const MerchantLayout({
    Key? key,
    required this.merchantUser,
  }) : super(key: key);

  final MerchantUser? merchantUser;

  @override
  State<MerchantLayout> createState() => _MerchantLayoutState();
}

class _MerchantLayoutState extends State<MerchantLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (context) => MerchantLayoutCubit()
          ..getMerchantProducts(merchantId: widget.merchantUser?.sId ?? '')
          ..getMerchantCategories(merchantId: widget.merchantUser?.sId ?? ''),
        child: BlocConsumer<MerchantLayoutCubit, MerchantLayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MerchantLayoutCubit cubit = MerchantLayoutCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: CachedNetworkImage(
                  imageUrl:
                      Urls.filesUrl + (widget.merchantUser?.marketLogo ?? ''),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: AppStrings.products),
                    Tab(text: AppStrings.categories),
                    Tab(text: AppStrings.offers),
                  ],
                  physics: BouncingScrollPhysics(),
                ),
                title: MText(
                  text:
                      widget.merchantUser?.marketName ?? AppStrings.welcomeHere,
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: AppSize.s20,
                  ),
                ),
              ),
              body: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ProductScreen(merchantId: widget.merchantUser?.sId ?? ''),
                  const MerchantCategoriesScreen(),
                  const OffersScreen(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
