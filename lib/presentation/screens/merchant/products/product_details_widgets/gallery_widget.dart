import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/functions.dart';
import '../../../../../config/urls.dart';
import '../../../../../domain/models/product_models/merchant_products_model.dart';
import '../../../../components/default_image.dart';
import '../../../../components/full_screen_picture.dart';
import '../../../../components/my_page_view.dart';
import '../../../../components/my_text.dart';
import '../../../../layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class GalleryWidget extends StatelessWidget {
  GalleryWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MerchantProduct? product;

  final PageController galleryController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MerchantLayoutCubit()..getProductGallery(proId: product?.id ?? ''),
      child: BlocConsumer<MerchantLayoutCubit, MerchantLayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MerchantLayoutCubit cubit = MerchantLayoutCubit.get(context);
          if (state is GetProductGalleryDoneState) {
            return MyPageView(
              controller: galleryController,
              height: AppSize.s260,
              pageWidget: (context, index) {
                if (index == 0) {
                  return buildMainImage(context);
                } else {
                  return GestureDetector(
                    onTap: () {
                      navigateTo(
                        context,
                        FullScreenPicture(
                          imageUrl:
                              Urls.filesUrl + (state.gallery?[index - 1] ?? ''),
                        ),
                      );
                    },
                    child: Hero(
                      tag: Urls.filesUrl + (state.gallery?[index - 1] ?? ''),
                      child: DefaultImage(imageUrl: state.gallery?[index - 1]),
                    ),
                  );
                }
              },
              itemCount: 1 + state.gallery!.length,
            );
          } else {
            return buildMainImage(context);
          }
        },
      ),
    );
  }

  Widget buildMainImage(context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          FullScreenPicture(
            imageUrl: Urls.filesUrl + (product?.mainImage ?? ''),
          ),
        );
      },
      child: Hero(
        tag: product?.mainImage ?? '',
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            DefaultImage(imageUrl: product?.mainImage),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsetsDirectional.all(AppMargin.m8),
                height: 40.0,
                width: 40.0,
                decoration: getDeco(withShadow: true, borderSize: AppSize.s8),
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
                      text: product?.name ?? 'Product Name',
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
    );
  }
}
