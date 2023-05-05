import 'package:ecommerce/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:ecommerce/presentation/screens/merchant/products/product_details_widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/functions.dart';
import '../../../../../config/urls.dart';
import '../../../../../domain/models/product_models/merchant_products_model.dart';
import '../../../../components/default_image.dart';
import '../../../../components/full_screen_picture.dart';
import '../../../../components/my_page_view.dart';
import '../../../../components/my_text.dart';
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
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        if (state is GetProductGalleryDoneState || cubit.gallery.isNotEmpty) {
          return MyPageView(
            controller: galleryController,
            height: AppSize.s260,
            pageWidget: (context, index) {
              if (index == 0) {
                return buildMainImage(context);
              } else if (index == cubit.gallery.length + 1 &&
                  cubit.videoUrl.isNotEmpty) {
                return const VideoWidget(
                  videoUrl:
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                );
              } else {
                return Hero(
                  tag: Urls.filesUrl + (cubit.gallery[index - 1] ?? ''),
                  child: DefaultImage(
                    imageUrl: cubit.gallery[index - 1],
                    clickable: true,
                  ),
                );
              }
            },
            itemCount: (cubit.videoUrl.isNotEmpty ? 1 : 0) +
                (1 + cubit.gallery.length),
          );
        } else {
          return buildMainImage(context);
        }
      },
    );
  }

  Widget buildMainImage(context) {
    return Hero(
      tag: product?.mainImage ?? '',
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          DefaultImage(
            imageUrl: product?.mainImage,
            clickable: true,
          ),
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
    );
  }
}
