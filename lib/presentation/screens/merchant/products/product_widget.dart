import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/presentation/screens/merchant/products/product_details/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/functions.dart';
import '../../../../domain/models/product_models/merchant_products_model.dart';
import '../../../components/my_text.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MerchantProduct? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          DetailsScreen(
            product: product,
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            margin:
                const EdgeInsetsDirectional.symmetric(horizontal: AppMargin.m8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: AppSize.s200,
            width: double.infinity,
            decoration: getDeco(borderSize: AppSize.s8),
            child: Hero(
              tag: product?.mainImage ?? 'Details',
              child: CachedNetworkImage(
                imageUrl: Urls.filesUrl + (product?.mainImage ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: AppPadding.p4,
              end: AppPadding.p8,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.heart,
                color: ColorManager.darkPrimary,
                size: AppSize.s40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
