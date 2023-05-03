import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/app/languages.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../config/urls.dart';
import '../../../../../domain/models/product_models/merchant_products_model.dart';
import '../../../../resources/color_manager.dart';
import 'full_screen_picture.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MerchantProduct? product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  navigateTo(
                    context,
                    FullScreenPicture(
                      imageUrl:
                          Urls.filesUrl + (widget.product?.mainImage ?? ''),
                    ),
                  );
                },
                child: Hero(
                  tag: widget.product?.mainImage ?? 'Details',
                  child: SizedBox(
                    height: 260.0,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              Urls.filesUrl + (widget.product?.mainImage ?? ''),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            margin:
                                const EdgeInsetsDirectional.all(AppMargin.m8),
                            height: 40.0,
                            width: 40.0,
                            decoration: getDeco(
                                withShadow: true, borderSize: AppSize.s8),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: ColorManager.white,
                                size: AppSize.s25,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            height: 40.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorManager.lightPrimary.withOpacity(.4),
                              borderRadius: const BorderRadiusDirectional.only(
                                  topStart: Radius.circular(AppSize.s8),
                                  topEnd: Radius.circular(AppSize.s8)),
                            ),
                            child: Center(
                              child: Material(
                                color: Colors.transparent,
                                child: MText(
                                  text: widget.product?.name ?? 'Product Name',
                                  style: getBlackStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
